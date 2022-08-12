#!/bin/bash

cd /home/knam/work/sfrugiperda_SNP/mt/gvcf.2/

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa --variant gvcf.2/FL.17.g.vcf.gz --variant gvcf.2/FG4.g.vcf.gz --variant gvcf.2/FL.16.g.vcf.gz --variant gvcf.2/FL.18.g.vcf.gz --variant gvcf.2/FL.20.g.vcf.gz --variant gvcf.2/FL.19.g.vcf.gz --variant gvcf.2/FG2.g.vcf.gz --variant gvcf.2/FG3.g.vcf.gz --variant gvcf.2/G_1.1.g.vcf.gz --variant gvcf.2/G_1.2.g.vcf.gz --variant gvcf.2/G_2.2.g.vcf.gz --variant gvcf.2/PR12.g.vcf.gz --variant gvcf.2/G_2.3.g.vcf.gz --variant gvcf.2/PR14.g.vcf.gz --variant gvcf.2/PR15.g.vcf.gz --variant gvcf.2/PR16.g.vcf.gz --variant gvcf.2/PR18.g.vcf.gz --variant gvcf.2/PR1.g.vcf.gz --variant gvcf.2/PR19.g.vcf.gz --variant gvcf.2/PR27.g.vcf.gz --variant gvcf.2/PR31.g.vcf.gz --variant gvcf.2/PR32.g.vcf.gz --variant gvcf.2/PR30.g.vcf.gz --variant gvcf.2/PR29.g.vcf.gz --variant gvcf.2/PR33.g.vcf.gz --variant gvcf.2/PR35.g.vcf.gz --variant gvcf.2/PR5.g.vcf.gz -O /home/knam/work/sfrugiperda_SNP/mt/mergedgvcf/merged.2.g.vcf.gz

cd /home/knam/work/sfrugiperda_SNP/mt/vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa --variant /home/knam/work/sfrugiperda_SNP/mt/mergedgvcf/merged.2.g.vcf.gz -O merged.2.vcf.gz -all-sites

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa -V merged.2.vcf.gz -O merged.2.SNP.vcf.gz

/home/knam/save/programs/vcftools_0.1.13/bin/vcftools --gzvcf merged.2.SNP.vcf.gz --plink --out merged.2
/home/knam/save/programs/plink1.9/plink --file merged.2 --make-bed --out merged.2 --allow-extra-chr

cd /home/knam/work/sfrugiperda_SNP/mt/pca

/home/knam/save/programs/flashpca_x86-64 --bfile ../vcf/merged.2 --suffix .merged.2 --memory 50000  --maxiter 100000 --seed 515103










