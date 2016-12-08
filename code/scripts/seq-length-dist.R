#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
len <- read.table(args[1], header=FALSE)
png(filename=args[2])
hist(len$V2,breaks=20,freq=FALSE, col="blue", xlab="Sequence Length (bp)")
dev.off()