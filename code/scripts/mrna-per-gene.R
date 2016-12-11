#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
mrna <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(log(mrna$V1), breaks=10, freq=FALSE, col="orange", xlab="log(mRNA per gene)", main=NULL)
dev.off()