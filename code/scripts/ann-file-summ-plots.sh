#!/usr/bin/env bash

# 1. Histogram of the number of transcripts per gene
awk '$3=="mRNA"{print substr($10, 2, 11)}' data/raw/dmel-all-r6.13.gtf \
| sort -k 2 \
| uniq -c \
> data/processed/mrna.txt 

code/scripts/mrna-per-gene.R data/processed/mrna.txt \
output/figures/mrna.PNG

# 2. Histogram of the length of genes
awk '$3=="gene"{print $5 - $4}' data/raw/dmel-all-r6.13.gtf \
> data/processed/gene-len.txt

code/scripts/gene-length.R data/processed/gene-len.txt \
output/figures/gene-len.PNG

# 3. Histogram of the length of exons

awk '$3=="exon" {print $5 - $4}' data/raw/dmel-all-r6.13.gtf \
> data/processed/exon-len.txt

code/scripts/exon-length.R data/processed/exon-len.txt \
 output/figures/exon-len.PNG