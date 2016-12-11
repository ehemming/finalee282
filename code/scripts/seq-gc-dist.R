#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
GC <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(GC$V2, breaks=20, freq=FALSE, col="green", xlab="Sequence GC%", main=NULL)
dev.off()