library("seqinr")

myfiles<-list.files(".",pattern="best.nuc.fas")
#myfiles<-head(myfiles,10)

kaks_calc<-function(file) {
al<-read.alignment(file,format="fasta")
al$nam<-sapply(strsplit(al$nam,"_"),"[[",1)
alx<-kaks(al)
res<-cbind(quantile(alx$ka,seq(0.01,1,0.01)),quantile(alx$ks,seq(0.01,1,0.01)))
colnames(res)<-c("ka","ks")
res
}

x<-lapply(myfiles,kaks_calc)
names(x)<-sapply(strsplit(myfiles,'\\.'),"[[",1)

# get max values for ka and ks
#ka<-data.frame(lapply(x,function(y) { y[5,1]  } ) ) 
ka<-data.frame(lapply(x,function(y) { max(y[which(y[,1]<9.9),1])  } ) )
ka<-ka[order(ka)]

#ks<-data.frame(lapply(x,function(y) { y[5,2]  } ) ) 
ks<-data.frame(lapply(x,function(y) { max(y[which(y[,2]<9.9),2])  } ) )
ks<-ks[order(ks)]

#new work 20/1/2020
max<-data.frame(t(ka),t(ks))

colnames(max)<-c("ka","ks")

max<-max[which(max$ka>-Inf),]

max<-max[which(max$ks>-Inf),]

max$r<-max$ka/max$ks

# get median values for ka and ks
ka<-data.frame(lapply(x,function(y) { y[3,1]  } ) ) 
ka<-ka[order(ka)]

ks<-data.frame(lapply(x,function(y) { y[3,2]  } ) ) 
ks<-ks[order(ks)]

#new work 20/1/2020
med<-data.frame(t(ka),t(ks))

colnames(med)<-c("ka","ks")

med<-med[which(med$ka>-Inf),]

med<-med[which(med$ks<-Inf),]

med$r<-med$ka/med$ks

pdf("scatterplot.pdf")
plot(max$ka,max$ks,main="max",xlab="Ka",ylab="Ks")
plot(med$ka,med$ks,main="median",xlab="Ka",ylab="Ks")
dev.off()

save.image("kaks_calc.RData")
