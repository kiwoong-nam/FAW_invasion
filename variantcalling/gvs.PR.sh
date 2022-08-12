#!/bin/bash
#SBATCH --mem=40G

#file name: gvs.PR.sh

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.PR.g.vcf.gz --variant ../nuc_2/gvcf/PR12.g.vcf.gz --variant ../nuc_2/gvcf/PR14.g.vcf.gz --variant ../nuc_2/gvcf/PR15.g.vcf.gz --variant ../nuc_2/gvcf/PR16.g.vcf.gz --variant ../nuc_2/gvcf/PR18.g.vcf.gz --variant ../nuc_2/gvcf/PR19.g.vcf.gz --variant ../nuc_2/gvcf/PR1.g.vcf.gz --variant ../nuc_2/gvcf/PR27.g.vcf.gz --variant ../nuc_2/gvcf/PR29.g.vcf.gz --variant ../nuc_2/gvcf/PR30.g.vcf.gz --variant ../nuc_2/gvcf/PR31.g.vcf.gz --variant ../nuc_2/gvcf/PR32.g.vcf.gz --variant ../nuc_2/gvcf/PR33.g.vcf.gz --variant ../nuc_2/gvcf/PR35.g.vcf.gz --variant ../nuc_2/gvcf/PR5.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.PR.g.vcf.gz  -O ../vcf/PR.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V PR.vcf.gz -O PR.SNP.vcf.gz


