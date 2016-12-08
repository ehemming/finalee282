The scripts in this folder were used to complete the final bioinformatics project. The script files are broken down according to the assignment structure

**The scripts assume that you are in the main finalee282 directory when you are executing them (cd ~/finalee282)**

**Summary report scripts need to be executed prior to summary plot scripts**

#Summarize a genome assembly
##Summary report
### code/scripts/gen-ass-summ-rep.sh
This script produces a report with the following information for all sequences, as well as sequences split by >100kb and <100kb:
1. Total number of nucleotides
2. Total number of Ns
3. Total number of sequences

The report is printed to output/reports/summary.txt

##Summary plots
### code/scripts/gen-ass-sum-plots.sh
This script produces the following plots:
1. Sequence length distribution
2. Sequence GC% distribution
3. Cumulative genome size sorted from largest to smallest sequences

*This bash script is dependent on the following R scripts located in this folder and must be executible (chmod u+x filename)*
- code/scripts/seq-length-dist.R
- code/scripts/seq-qc-dist.R
- plotCDF in JJeutils

The plots are printed to output/figures/filename.PNG

#Summarize an annotation file
##Summary report
### code/scripts/ann-file-summ-rep.sh
This script produces a report with the following information:
1. Total number of features of each type, sorted from the most common to the least common
2. Total number of genes per chromosome arm (X, Y, 2L, 2R, 3L, 3R, 4)

The report is printed to output/reports/summary-gtf.txt

##Summary plots
### code/scripts/ann-file-summ-plots.sh
This script produces the following plots:
1. Histogram of the number of transcripts per gene
2. Histogram of the length of genes
3. Histogram of the length of exons

*This bash script is dependent on the following R scripts which are included in this folder and must be executible (chmod u+x filename)*
- code/scripts/mrna-per-gene.R
- code/scripts/gene-length.R
- code/scripts/exon-length.R

The plots are printed to output/figures/filename.PNG
 