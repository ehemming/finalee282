#!/usr/bin/env bash
module load jje/kent/2014.02.19 jje/jjeutils/0.1a >/dev/null 2>&1

fastapath="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/fasta/dmel-all-chromosome-r6.13.fasta.gz" #give path to download fasta file

infile="data/raw/dmel-all-chromosome-r6.13.fasta.gz" #define downloaded fasta infile path/name
plotpath="output/figures" #define plot output path

if [ ! -f $infile ]
then
wget -O - -q $fastapath \
> $infile
fi

gunzip -c $infile \
| tee >(bioawk -c fastx '{ print $name, "\t", gc($seq) }' \
    | code/scripts/seq-gc-dist.R stdin \
    $plotpath/GC.PNG ) \
| faSize -detailed /dev/stdin \
| sort -rnk 2,2 \
| tee >(code/scripts/seq-length-dist.R stdin \
    $plotpath/seqlendist.PNG ) \
| awk ' BEGIN { print "chr\tLength\tAssembly\nnone\t0\tDmel" } { print $0 "\tDmel" }'  \
| awk 'NF==3' \
| awk '$2!="device"' \
| plotCDF2 /dev/stdin \
 $plotpath/CDF2.PNG 
