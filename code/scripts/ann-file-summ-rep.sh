#!/usr/bin/env bash
module load jje/kent/2014.02.19 jje/jjeutils/0.1a >/dev/null 2>&1

gtfpath="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gtf/dmel-all-r6.13.gtf.gz" #define path to download gtf annotation file
infile="data/raw/dmel-all-r6.13.gtf.gz" #define downloaded gtf infile path/name
outfile="output/reports/summary-gtf.txt" #define summary report outfile path/name

if [ ! -f $infile ]
then
wget -O - -q $gtfpath \
> $infile
fi

#Problem 1
echo "#Total number of features of each type" > $outfile
gunzip -c $infile \
| sort -k 3  \
| awk '{print $3}' \
| uniq -c \
| sort -rnk 1 \
| awk '{print $2 "\t" $1}' \
> cat >>$outfile

#Problem 2
echo -e "\n#Total number of genes per chromosome arm" \
| cat >>$outfile

gunzip -c $infile \
| awk '$3~/^gene/{print $1}' \
| awk '$1~/^[X4Y]$|^[23][LR]$/' \
| sort -nk 1 \
| uniq -c \
| sort -rnk 1 \
| awk '{print $2 "\t" $1}' \
> cat >>$outfile