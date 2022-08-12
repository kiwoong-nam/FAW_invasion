#!/bin/bash
#SBATCH --mem=60G

#file name: gvs.FL.sh

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.FL.g.vcf.gz --variant ../nuc_1/gvcf/FCC1.g.vcf.gz --variant ../nuc_1/gvcf/FCC2.g.vcf.gz --variant ../nuc_1/gvcf/FCC3.g.vcf.gz --variant ../nuc_1/gvcf/FCC4.g.vcf.gz --variant ../nuc_1/gvcf/FCC5.g.vcf.gz --variant ../nuc_1/gvcf/FCC6.g.vcf.gz --variant ../nuc_1/gvcf/FCC7.g.vcf.gz --variant ../nuc_1/gvcf/FCC8.g.vcf.gz --variant ../nuc_1/gvcf/FGJ10.g.vcf.gz --variant ../nuc_1/gvcf/FGJ11.g.vcf.gz --variant ../nuc_1/gvcf/FGJ12.g.vcf.gz --variant ../nuc_1/gvcf/FGJ2.g.vcf.gz --variant ../nuc_1/gvcf/FGJ3.g.vcf.gz --variant ../nuc_1/gvcf/FGJ4.g.vcf.gz --variant ../nuc_1/gvcf/FGJ5.g.vcf.gz --variant ../nuc_1/gvcf/FGJ6.g.vcf.gz --variant ../nuc_1/gvcf/FGJ7.g.vcf.gz --variant ../nuc_1/gvcf/FGJ8.g.vcf.gz --variant ../nuc_1/gvcf/FGJ9.g.vcf.gz --variant ../nuc_2/gvcf/FL.16.g.vcf.gz --variant ../nuc_2/gvcf/FL.17.g.vcf.gz --variant ../nuc_2/gvcf/FL.18.g.vcf.gz --variant ../nuc_2/gvcf/FL.19.g.vcf.gz --variant ../nuc_2/gvcf/FL.20.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.FL.g.vcf.gz  -O ../vcf/FL.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V FL.vcf.gz -O FL.SNP.vcf.gz


