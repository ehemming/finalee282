#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
exonlen <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(log(exonlen$V1), breaks=20, freq=FALSE, col="purple", xlab="log(Length of exons)", main=NULL)
dev.off()