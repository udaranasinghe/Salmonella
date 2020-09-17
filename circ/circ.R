# take blast all vs all data and make a matrix of bitscores (total)
# then make a heatmap

library(RColorBrewer)

x <- read.table("circ.out")

x$V4 <- paste(x$V1,x$V2)

xx <- aggregate(V3 ~ V4, x, sum)

xx$V2 <- sapply(strsplit(xx$V4," "),"[[",2)
xx$V1 <- sapply(strsplit(xx$V4," "),"[[",1)

xx$V4 <- NULL

mx <- reshape(xx, idvar = "V1", timevar = "V2", direction = "wide")


mx[is.na(mx)] <- 0

rownames(mx) <- mx[,1]
mx[,1] <- NULL

colnames(mx) <- gsub("V3.","",colnames(mx))

mx <- as.matrix(mx)


pdf("circ.pdf")
heatmap(mx)
MIN=round(min(mx))
MEAN=round(mean(mx))
MAX=round(max(mx))
legend(x="topleft", legend=c(MIN, MEAN, MAX), 
     fill=colorRampPalette(brewer.pal(8, "Oranges"))(3),
     title="bit score")
mtext("BLASTN aggregated bit score")
dev.off()

