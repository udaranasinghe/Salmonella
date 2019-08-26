x<-read.table("study materials/research/abyssMetrics.tsv.txt",header=T)
head(x)
c30<-subset(x,CovVal=="c30")
c40<-subset(x,CovVal=="c40")
c50<-subset(x,CovVal=="c50")

# of contigs
pdf("study materials/research/R scripting/metricPlots.pdf")
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="No.contigs",xlab="isolate",ylab="number of contigs")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# n.500
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="n.500",xlab="isolate",ylab="n.500")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)

# L50
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="L50",xlab="isolate",ylab="L50")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# minimum contig lenth
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="minimum lenth",xlab="isolate",ylab="minimum contig lenth")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)

# N80
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="N80",xlab="isolate",ylab="N80")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# N50
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="N50",xlab="isolate",ylab="N50")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# N20
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="N20",xlab="isolate",ylab="N20")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# E.size
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="E.size",xlab="isolate",ylab="E.size")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# Maximum contig lenth
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="Maximum lenth",xlab="isolate",ylab="Maximum lenth")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)


# total lenth
plot(c30$n,ylim=c(0,1000),bty="n",col="darkgray",xaxt="n",pch=19, main="Total lenth",xlab="isolate",ylab="Total lenth")
points(c40$n,col="red",pch=19)
points(c50$n,col="blue",pch=19)
axis(1,at=1:nrow(c30), labels=FALSE)
text(1:nrow(c30), par("usr")[3] - 0.2,labels=c30$name , cex=0.7 ,srt=90, pos=1, xpd=T,offset=2)

dev.off()
