#!/bin/bash
#SBATCH --mem=60G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.BR.g.vcf.gz --variant ../nuc_3/gvcf/CC38.g.vcf.gz --variant ../nuc_3/gvcf/CC40.g.vcf.gz --variant ../nuc_3/gvcf/CC41.g.vcf.gz --variant ../nuc_3/gvcf/CC44.g.vcf.gz --variant ../nuc_3/gvcf/CC66.g.vcf.gz --variant ../nuc_3/gvcf/CC69.g.vcf.gz --variant ../nuc_3/gvcf/rCC1.g.vcf.gz --variant ../nuc_3/gvcf/rCC20.g.vcf.gz --variant ../nuc_3/gvcf/rCC25.g.vcf.gz --variant ../nuc_3/gvcf/rCC5.g.vcf.gz 

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.BR.g.vcf.gz  -O ../vcf/BR.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V BR.vcf.gz -O BR.SNP.vcf.gz



