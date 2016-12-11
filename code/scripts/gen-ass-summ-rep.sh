#!/usr/bin/env bash
module load jje/kent/2014.02.19 jje/jjeutils/0.1a >/dev/null 2>&1

fastapath="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/fasta/dmel-all-chromosome-r6.13.fasta.gz" #give path to download fasta file
infile="data/raw/dmel-all-chromosome-r6.13.fasta.gz" #define downloaded fasta infile path/name
outfile="output/reports/summary-fasta.txt" #define summary report outfile path/name

if [ ! -f $infile ]
then
wget -O - -q $fastapath \
> $infile
fi

#Problems 1-3

echo "#All sequence lengths" > $outfile
gunzip -c  $infile \
| tee >(grep -c "^>" \
    | awk '{print "Total number of sequences:", "\t", $1}' \
    | cat >>$outfile) \
| grep -v ">" \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides:", "\t", $1}' \
    | cat >>$outfile) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns:", "\t", $1, "\n"}' \
| cat >>$outfile

#Problem 4
##>100kb
echo "#Sequences >100kb" \
| cat >>$outfile

gunzip -c $infile \
| bioawk -c fastx '{print $seq, length($seq)}' \
| awk '$2 >100000{print $1}' \
| tee >(wc -l \
    | awk '{print "Total number of sequences:", "\t", $1}' \
    | cat >>$outfile) \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides:", "\t", $1}' \
    | cat >>$outfile) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns:", "\t", $1, "\n"}' \
| cat >>$outfile

##<100kb
echo "#Sequences <100kb" \
| cat >>$outfile

gunzip -c $infile \
| bioawk -c fastx '{print $seq, length($seq)}' \
| awk '$2 <100000{print $1}' \
| tee >(wc -l \
    | awk '{print "Total number of sequences:", "\t", $1}' \
    | cat >>$outfile) \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides:", "\t", $1}' \
    | cat >>$outfile) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns:", "\t", $1}' \
| cat >>$outfile