#!/bin/bash
#SBATCH --mem=100G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.CHN.g.vcf.gz --variant ../nuc_4/gvcf/L01.g.vcf.gz --variant ../nuc_4/gvcf/L03.g.vcf.gz 


