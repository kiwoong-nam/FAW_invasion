#!/bin/bash
#SBATCH --mem=40G

#file name: gvs.MS.sh

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.MS.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C1.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C2.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C3.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C4.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C5.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C6.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C7.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C8.g.vcf.gz --variant ../nuc_1/gvcf/MS_C_C9.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R2.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R3.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R4.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R5.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R6.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R7.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R8.g.vcf.gz --variant ../nuc_1/gvcf/MS_R_R9.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.MS.g.vcf.gz  -O ../vcf/MS.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V MS.vcf.gz -O MS.SNP.vcf.gz

