library(gplots)

x<-read.table("gene_presence_absence.Rtab",header=TRUE,row.names=1)

png("gene_heatmap.png",width = 960, height = 960)

heatmap.2(as.matrix(x),scale="none",margin=c(15, 15),cexRow=0.6,trace="none")

dev.off()

png("isolate_cor.png",width = 960, height = 960)

heatmap.2(cor(x),scale="none",margin=c(10, 10),cexRow=0.6,trace="none",cexCol=0.6)

dev.off()


png("gene_cor.png",width = 960, height = 960)

av<-apply(x,1,mean)
xx<-x[which(av!=1 & av!=0),]
cxx<-cor(t(xx))
heatmap.2(cxx,scale="none",margin=c(10, 10),cexRow=0.6,trace="none",cexCol=0.6)

dev.off()

# heirachical clustering
noncore<-x[which(rowMeans(x)!=1),]
hr <- hclust(as.dist(1-cor(t(noncore), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.9))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- rev(redgreen(75))

pdf("heirachical_clusters.pdf",width=7, height=8)
colfunc <- colorRampPalette(c("blue", "white", "red"))
heatmap.2(as.matrix(noncore), main="Hierarchical Cluster", Rowv=as.dendrogram(hr),
 dendrogram="both", scale="none", col = colfunc(15), density.info="none", trace="none",
 margins=c(15,10), RowSideColors= myClusterSideBar)
dev.off()
write.table(mycl,file="clusters.txt",quote=F,sep="\t")

