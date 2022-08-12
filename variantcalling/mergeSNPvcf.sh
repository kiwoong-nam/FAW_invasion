#!/bin/bash

module load bioinfo/tabix-0.2.5
module load bioinfo/vcftools-0.1.15

cd /home/knam/work/sfrugiperda_SNP/Invasive

vcf-concat vcf/*.SNP.vcf.gz | /home/knam/save/programs/htslib-1.9/bgzip > Invasive.SNP.vcf.gz
/home/knam/save/programs/htslib-1.9/tabix -p vcf Invasive.SNP.vcf.gz

#/home/knam/save/programs/gatk-4.1.2.0/gatk VariantFiltration -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V Invasive.SNP.vcf.gz --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "my_snp_filter" -O Invasive.SNP.filtered.vcf.gz

#zcat FL.SNP.annoted.vcf.gz | grep -P '#|PASS' | /home/knam/save/programs/vcftools_0.1.13/bin/vcftools --vcf - --max-missing 0.5 --out Invasive.SNP.filtered --recode #Perform filtering

#/home/knam/save/programs/htslib-1.9/bgzip Invasive.SNP.filtered.recode.vcf #compress the new vcf file
#/home/knam/save/programs/htslib-1.9/tabix -p vcf Invasive.SNP.filtered.recode.vcf.gz #index the vcf file

