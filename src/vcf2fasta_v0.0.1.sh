#!/bin/bash
#$ -N 20190702_1031_gatk4_farm
#$ -ckpt restart
#$ -q som,pub64,free64,asom
#$ -pe make 64
#$ -t 1-3

## load modules
module load gatk 

####################
## create variables
####################

## create path2vcf data variable
path2vcf='/dfs3/som/dalawson/drb/deepcelllineage/mitolin/data/gen/nguyen_nc_2018/20190502-KB/ind2/genomic/'

## create variable for list of vcf filenames
filenamelist=${path2vcf}vcf_list.txt

## create a name with vcf extension variable
namewvcfext=`head -n $SGE_TASK_ID $filenamelist | tail -n 1 | cut -f1`

## remove the vcfext from name
name=${namewvcfext%.vcf}

## create output path
path2output='/dfs3/som/dalawson/drb/deepcelllineage/mitolin/data/gen/nguyen_nc_2018/20190702-fastas-on-hpc/'

## create filename extension variables
faext='.fasta'

## create path to reference fasta
path2ref='/dfs3/som/dalawson/drb/deepcelllineage/mitolin/data/ref/ucsc/bundles/hg19/'

## assign reference fasta filename to a variable
ref='ucsc.hg19.fasta'

####################################
## Run FastaAlternateReferenceMaker
####################################

./gatk FastaAlternateReferenceMaker \
    -O $path2output$name$faext
    -R $path2ref$ref
    -V $path2vcf$namewvcfext