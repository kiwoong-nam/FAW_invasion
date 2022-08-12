#!/bin/bash

cd /home/knam/work/sfrugiperda_SNP/Invasive/ref

split -l 2 /home/knam/work/sfrugiperda_SNP/nuc_2/ref/sfC.ver7.fa

FILES=/home/knam/work/sfrugiperda_SNP/Invasive/ref/x*

i=1
for f in $FILES
do
 mv $f $i.fa
 /home/knam/save/programs/gatk-4.1.2.0/gatk CreateSequenceDictionary -R=$i.fa -O=$i.dict
 /home/knam/save/programs/samtools-1.9/samtools faidx $i.fa
 i=$(($i + 1))
done

