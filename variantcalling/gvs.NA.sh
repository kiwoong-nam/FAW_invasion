#!/bin/bash
#SBATCH --mem=200G
#SBATCH -p unlimitq

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

#/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.NA.g.vcf.gz --variant merged.MS.g.vcf.gz --variant merged.PR.g.vcf.gz --variant merged.FL.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.NA.g.vcf.gz  -O ../vcf/NA.vcf.gz -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V NA.vcf.gz -O NA.SNP.vcf.gz

