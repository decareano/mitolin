#!/bin/bash

#file = '/Users/marcelo/Documents/mitolin/data/gen/nguyen_nc_2018/20190613-fastas/chrMchr1-1.fasta.eg'
while IFS= read -r line
do

 
    echo "$line"
 
done < chrMchr1-1.fasta.eg
# if [[ "$line" == ">2 chr1:1-X" ]]; then    # echo line is stored in $line
#    echo "$line"
# fi