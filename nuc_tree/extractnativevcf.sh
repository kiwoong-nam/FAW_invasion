#!/bin/bash

module load bioinfo/tabix-0.2.5 
module load bioinfo/vcftools-0.1.15

iv=/home/knam/work/sfrugi_Invasive/SNP/vcf/Invasive.SNP.filtered.vcf.gz

cd /home/knam/work/sfrugi_Invasive/Tree_outgroup/vcf

vcftools --gzvcf $iv --keep nativelist.txt --recode --stdout |  bgzip -cf > Native.vcf.gz 

