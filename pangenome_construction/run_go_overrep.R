# total genes
x<-read.table("gene_presence_absence.Rtab",header=TRUE,row.names=1)
Q=nrow(x)
clusters<-read.table("clusters.txt")
godb<-read.table("/mnt/md0/salmonella/go/uniprot2go.tsv")
godb<-godb[,2:3]
godb<-unique(godb)
myres<-NULL

for ( CLUSTER in unique(clusters$x)) {
    genes<-row.names(clusters)[which(clusters$x==CLUSTER)]
    genes<-genes[which(genes %in% godb$V2)]
    N=length(genes)
    if ( N > 4 ) {
        itx<-godb[which(godb$V2 %in% genes),]
            for ( go_term in unique(itx$V3 ) ) {
                M=length(which(godb$V3 %in% go_term))
                K=length(which(itx$V3 %in% go_term))
                mx<-matrix(c(Q,N,M,K),nrow=2)
                fet<-fisher.test(mx,alternative="two.sided")
                res<-cbind(CLUSTER,  Q, M,N,K,fet$estimate,fet$conf.int[1],fet$conf.int[2],fet$p.value  )
                rownames(res)<-go_term
                colnames(res)=c("cluster","totalGenes","totalGenesInGOset","genesInCLuster","genesInClusterInGOset",
                  "oddsRatio","CI95lower","CI95higher","Fisher_pval")
                res<-as.data.frame(res)
                res$goterm<-go_term
                rownames(res)<-paste(CLUSTER,go_term,sep="_")
                res$genes<-paste0(as.character(itx[which(itx$V3 %in% go_term),1]),collapse=",")                
                myres<-rbind(myres,res)
        }
    }
}

myres<-as.data.frame(myres)
myres<-subset(myres,genesInClusterInGOset>2)
myres<-myres[order(myres$Fisher_pval),] 
myres$FDR<-p.adjust(myres$Fisher_pval,method="fdr")
write.table(myres,file="go_res.tsv",sep="\t",quote=FALSE)

















