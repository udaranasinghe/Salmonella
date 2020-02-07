
# clusters of genes
x<-read.table("clusters.txt",header=T)

# gene universe
u<-read.table("gene_presence_absence.Rtab",header=T)
u<-u[,1]

# get size of each cluster
sapply(unique(x$x) , function(i) { length(which(x$x==i)) })
