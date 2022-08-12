#!/bin/bash

cd /media/kiwoong/c4a81c8c-7d02-476b-82c1-ecc5538cdcae/sfrugiperda_SNP/mergedgvcf

/home/kiwoong/bioinformatics/gatk-4.1.2.0/gatk CombineGVCFs -R /home/kiwoong/Desktop/sfrugiperda_SNP/nuc_2/ref/sfC.ver7.fa -O merged.Invasive.g.vcf.gz --variant merged.WestAfr.g.vcf.gz --variant merged.EastAfr.g.vcf.gz --variant merged.India.g.vcf.gz --variant merged.CHN.g.vcf.gz --variant merged.G_FG.g.vcf.gz --variant merged.MS.g.vcf.gz --variant merged.PR.g.vcf.gz --variant merged.BR.g.vcf.gz --variant merged.FL.g.vcf.gz --variant merged.MX.g.vcf.gz


