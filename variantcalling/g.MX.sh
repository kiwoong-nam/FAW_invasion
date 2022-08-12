#!/bin/bash
#SBATCH --mem=100G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.MX.g.vcf.gz --variant ../nuc_4/gvcf/MEX13.g.vcf.gz --variant ../nuc_4/gvcf/MEX15.g.vcf.gz --variant ../nuc_4/gvcf/MEX16.g.vcf.gz --variant ../nuc_4/gvcf/MEX18.g.vcf.gz --variant ../nuc_4/gvcf/MEX21.g.vcf.gz --variant ../nuc_4/gvcf/MEX23.g.vcf.gz --variant ../nuc_4/gvcf/MEX25.g.vcf.gz --variant ../nuc_4/gvcf/MEX27.g.vcf.gz --variant ../nuc_4/gvcf/MEX28.g.vcf.gz --variant ../nuc_4/gvcf/MEX31.g.vcf.gz --variant ../nuc_4/gvcf/MEX33.g.vcf.gz --variant ../nuc_4/gvcf/MEX35.g.vcf.gz --variant ../nuc_4/gvcf/MEX38.g.vcf.gz --variant ../nuc_4/gvcf/MEX6.g.vcf.gz --variant ../nuc_4/gvcf/MEX8.g.vcf.gz --variant ../nuc_4/gvcf/MEX9.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0039.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0040.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0041.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0042.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0043.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0044.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0045.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0046.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0047.g.vcf.gz --variant ../nuc_1/gvcf/KNAM_0048.g.vcf.gz


