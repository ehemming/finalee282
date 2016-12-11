#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
genelen <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(log(genelen$V1), breaks=20, freq=FALSE, col="yellow", xlab="log(Length of genes)", main=NULL)
dev.off()