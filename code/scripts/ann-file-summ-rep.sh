#!/usr/bin/env bash
module load perl
module load R
module load jje/kent/2014.02.19
module load jje/jjeutils/0.1a

#Get gtf annotation file
gtf="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gtf/dmel-all-r6.13.gtf.gz"
wget -O - -q $gtf \
| tee data/raw/dmel-all-r6.13.gtf.gz \
| gunzip \
> data/raw/dmel-all-r6.13.gtf

#Problem 1
echo "#Total number of features of each type" \
| cat >output/reports/summary-gtf.txt

sort -k 3 data/raw/dmel-all-r6.13.gtf \
| awk '{print $3}' \
| uniq -c \
| sort -rnk 1 \
> cat >>output/reports/summary-gtf.txt

#Problem 2
echo "#Total number of genes per chromosome arm" \
| cat >>output/reports/summary-gtf.txt

awk '$3~/^gene/{print $1, $3}' data/raw/dmel-all-r6.13.gtf \
| awk '$1~/^[X4Y]$|^[23][LR]$/' \
| sort -nk 1 \
| uniq -c \
| sort -rnk 1 \
> cat >>output/reports/summary-gtf.txt