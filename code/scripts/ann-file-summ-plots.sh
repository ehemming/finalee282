#!/usr/bin/env bash
module load jje/kent/2014.02.19 jje/jjeutils/0.1a >/dev/null 2>&1

gtfpath="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gtf/dmel-all-r6.13.gtf.gz" #define path to download gtf annotation file
infile="data/raw/dmel-all-r6.13.gtf.gz" #define downloaded gtf infile path/name
plotpath="output/figures" #define plot output path


if [ ! -f $infile ]
then
wget -O - -q $gtfpath \
> $infile
fi

gunzip -c $infile \
| tee >(awk '$3=="gene"{print $5 - $4}' \
    | code/scripts/gene-length.R stdin \
    $plotpath/gene-len.PNG ) \
| tee >(awk '$3=="exon" {print $5 - $4}' \
    | code/scripts/exon-length.R stdin \
    $plotpath/exon-len.PNG ) \
| awk '$3=="mRNA"{print substr($10, 2, 11)}' \
| sort -k 2 \
| uniq -c \
| code/scripts/mrna-per-gene.R stdin \
$plotpath/mrna.PNG