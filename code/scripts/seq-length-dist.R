#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
len <- read.table(args[1], header=FALSE)
png(filename=args[2])
hist(log(len$V2),breaks=40,freq=FALSE, col="blue", xlab="log(Sequence Length (bp))", main=NULL)
dev.off()