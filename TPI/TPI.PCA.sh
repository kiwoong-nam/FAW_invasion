#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_invasive/TPI

tabix -h ../SNP/vcf/Invasive.SNP.filtered.vcf.gz HiC_scaffold_29:8352257-8355137 > TPI.Invasive.vcf

vcftools --vcf TPI.Invasive.vcf --plink --out TPI.invasive

/home/kiwoong/bioinformatics/plink1.9/plink --file TPI.invasive --make-bed --out TPI.invasive 

/home/kiwoong/bioinformatics/plink1.9/plink --bfile TPI.invasive --pca 10 --out TPI.invasive --mind




