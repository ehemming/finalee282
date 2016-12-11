The scripts in this folder were used to complete the final bioinformatics project. The script files are broken down according to the provided assignment structure.

- **It is necessary to execute the scripts from the main ./finalee282 directory **
- *Scripts can be executed in any order*

#Summarize a genome assembly
##Summary report
### ./code/scripts/gen-ass-summ-rep.sh
This script produces a report with the following information for all sequences, as well as sequences split by >100kb and <100kb:
- Total number of nucleotides
- Total number of Ns
- Total number of sequences

**The report is printed to output/reports/summary-fasta.txt**

##Summary plots
### ./code/scripts/gen-ass-sum-plots.sh
This script produces the following plots:
- Sequence length distribution
- Sequence GC% distribution
- Cumulative genome size sorted from largest to smallest sequences

*This bash script is dependent on the following R scripts:*
- code/scripts/seq-length-dist.R
- code/scripts/seq-qc-dist.R
- plotCDF2 in jje/jjeeutils

**The plots are printed to output/figures/filename.PNG**

#Summarize an annotation file
##Summary report
### ./code/scripts/ann-file-summ-rep.sh
This script produces a report with the following information:
- Total number of features of each type, sorted from the most common to the least common
- Total number of genes per chromosome arm (X, Y, 2L, 2R, 3L, 3R, 4)

**The report is printed to output/reports/summary-gtf.txt**

##Summary plots
### ./code/scripts/ann-file-summ-plots.sh
This script produces the following plots:
- Histogram of the number of transcripts per gene
- Histogram of the length of genes
- Histogram of the length of exons

*This bash script is dependent on the following R scripts:*
- code/scripts/mrna-per-gene.R
- code/scripts/gene-length.R
- code/scripts/exon-length.R

**The plots are printed to output/figures/filename.PNG**
 