#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
genelen <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(genelen$V1, breaks=20, freq=FALSE, col="yellow", xlab="Length of genes")
dev.off()