#!/bin/bash

vcf=/home/knam/work/sfrugi_Invasive/Sudee/SNP/Invasive.SNP.filtered.vcf.gz

cd /home/knam/work/sfrugi_Invasive/Kiwoong/Admixture/input

/home/knam/save/programs/vcftools_0.1.13/bin/vcftools --gzvcf $vcf --plink --out invasive &> plink.log
/home/knam/save/programs/plink1.9/plink  --file invasive  --make-bed --out invasive &> bed.log


