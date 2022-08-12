#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/vcf

vcf-merge Native.vcf.gz SRR5132437.SNP.vcf.gz | vcftools --vcf - --max-missing 1 --recode --stdout |  bgzip -cf > Outgrouped.vcf.gz 

tabix -p vcf Outgrouped.vcf.gz 
