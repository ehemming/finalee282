#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
mrna <-read.table(args[1], header=FALSE)
png(filename=args[2])
hist(mrna$V1, breaks=20, freq=FALSE, col="orange", xlab="Number of mRNA per gene")
dev.off()