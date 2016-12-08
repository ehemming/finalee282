#!/usr/bin/env bash

gunzip -c data/raw/dmel-all-chromosome-r6.13.fasta.gz \
| tee >(bioawk -c fastx '{ print ">"$name, "\t", gc($seq) }' \
    > data/processed/gc.txt) \
| faSize -detailed /dev/stdin \
| sort -rnk 2,2 \
> data/processed/sorted.sizes.txt

#1. Sequence lenth distribution
code/scripts/seq-length-dist.R data/processed/sorted.sizes.txt output/figures/seqlendist.PNG

#2. Sequence GC% distribution
code/scripts/seq-gc-dist.R data/processed/gc.txt output/figures/GC.PNG

#3. Cumulative genome size sorted from largest to smallest sequences
plotCDF data/processed/sorted.sizes.txt output/figures/CDF.png

