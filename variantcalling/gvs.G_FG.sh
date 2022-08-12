#!/bin/bash
#SBATCH --mem=60G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.G_FG.g.vcf.gz --variant ../nuc_2/gvcf/FG2.g.vcf.gz --variant ../nuc_2/gvcf/FG3.g.vcf.gz --variant ../nuc_2/gvcf/FG4.g.vcf.gz --variant ../nuc_2/gvcf/G_1.1.g.vcf.gz --variant ../nuc_2/gvcf/G_1.2.g.vcf.gz --variant ../nuc_2/gvcf/G_2.2.g.vcf.gz --variant ../nuc_2/gvcf/G_2.3.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.G_FG.g.vcf.gz  -O ../vcf/G_FG.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V G_FG.vcf.gz -O G_FG.SNP.vcf.gz




