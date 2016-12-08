#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
exonlen <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(exonlen$V1, breaks=20, freq=FALSE, col="yellow", xlab="Length of exons")
dev.off()