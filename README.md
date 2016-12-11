This directory is for my final bioinformatics project working with the Drosophila melanogaster genome downloaded from flybase.org (current as of 12/10/2016).

After making the provided script files executible (chmod u+x ./code/scripts/*.sh ./code/scripts/*.R),
the entire output of this project can be generated from the main ./finalee282 directory by executing the following four bash scripts (in any order):
- ./code/scripts/gen-ass-summ-rep.sh
- ./code/scripts/gen-ass-summ-plots.sh
- ./code/scripts/ann-file-summ-rep.sh
- ./code/scripts/ann-file-summ-plots.sh

#This directory contains:
##code
- code/scripts contains all scripts necessary to download data and create output files
- more information can be found in code/scripts/README.md

##data
- contains raw data only
- no intermediate or processed data files are saved from the scripts (data/processed directory is empty)
- more information can be found in data/raw/README.md

##output
- output/reports contains two summary reports
- output/figures contains six summary plots
- more information can be found in output/figures/README.md and output/reports/README.md