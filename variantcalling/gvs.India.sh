#!/bin/bash
#SBATCH --mem=60G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.India.g.vcf.gz --variant ../nuc_1/gvcf/S3.g.vcf.gz --variant ../nuc_1/gvcf/B10.g.vcf.gz --variant ../nuc_1/gvcf/B12.g.vcf.gz --variant ../nuc_1/gvcf/B1.g.vcf.gz --variant ../nuc_1/gvcf/B2.g.vcf.gz --variant ../nuc_1/gvcf/B3.g.vcf.gz --variant ../nuc_1/gvcf/B4.g.vcf.gz --variant ../nuc_1/gvcf/B5.g.vcf.gz --variant ../nuc_1/gvcf/B6.g.vcf.gz --variant ../nuc_1/gvcf/B7.g.vcf.gz --variant ../nuc_1/gvcf/B8.g.vcf.gz --variant ../nuc_1/gvcf/B9.g.vcf.gz --variant ../nuc_1/gvcf/F1a.g.vcf.gz --variant ../nuc_1/gvcf/M1a.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.India.g.vcf.gz  -O ../vcf/India.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V India.vcf.gz -O India.SNP.vcf.gz


