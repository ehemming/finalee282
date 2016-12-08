#!/usr/bin/env bash
module load perl
module load R
module load jje/kent/2014.02.19
module load jje/jjeutils/0.1a

#Get fasta
fasta="ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/fasta/dmel-all-chromosome-r6.13.fasta.gz"

#Problems 1-3
echo "#All sequence lengths" > output/reports/summary.txt
wget -O - -q $fasta \
| tee  data/raw/dmel-all-chromosome-r6.13.fasta.gz \
| gunzip -c \
| tee >(grep -c "^>" \
    | awk '{print "Total number of sequences", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| grep -v ">" \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns", "\t", $1}' \
| cat >>output/reports/summary.txt

#Problem 4
##>100kb
echo "#Sequences >100kb" \
| cat >>output/reports/summary.txt

gunzip -c data/raw/dmel-all-chromosome-r6.13.fasta.gz \
| bioawk -c fastx '{print $seq, length($seq)}' \
| awk '$2 >100000{print $1}' \
| tee >(wc -l \
    | awk '{print "Total number of sequences", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns", "\t", $1}' \
| cat >>output/reports/summary.txt

##<100kb
echo "#Sequences <100kb" \
| cat >>output/reports/summary.txt

gunzip -c data/raw/dmel-all-chromosome-r6.13.fasta.gz \
| bioawk -c fastx '{print $seq, length($seq)}' \
| awk '$2 <100000{print $1}' \
| tee >(wc -l \
    | awk '{print "Total number of sequences", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| tee >(wc -m \
    | awk '{print "Total number of nucleotides", "\t", $1}' \
    | cat >>output/reports/summary.txt) \
| grep N -o \
| wc -l \
| awk '{print "Total number of Ns", "\t", $1}' \
| cat >>output/reports/summary.txt