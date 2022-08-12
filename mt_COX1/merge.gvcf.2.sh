#!/bin/bash

cd /home/knam/work/sfrugiperda_SNP/mt


/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa --variant gvcf.1/S3.g.vcf.gz --variant gvcf.1/MS_R_R5.g.vcf.gz  --variant gvcf.1/MS_R_R8.g.vcf.gz   --variant gvcf.1/B9.g.vcf.gz  --variant gvcf.1/B4.g.vcf.gz  --variant gvcf.1/B12.g.vcf.gz  --variant gvcf.1/B2.g.vcf.gz  --variant gvcf.1/B8.g.vcf.gz  --variant gvcf.1/B10.g.vcf.gz  --variant gvcf.1/FCC3.g.vcf.gz  --variant gvcf.1/FCC6.g.vcf.gz  --variant gvcf.1/BCW2.g.vcf.gz  --variant gvcf.1/FCC7.g.vcf.gz  --variant gvcf.1/FCC1.g.vcf.gz  --variant gvcf.1/B6.g.vcf.gz  --variant gvcf.1/B5.g.vcf.gz  --variant gvcf.1/B3.g.vcf.gz  --variant gvcf.1/B7.g.vcf.gz  --variant gvcf.1/FGJ11.g.vcf.gz  --variant gvcf.1/FCC2.g.vcf.gz  --variant gvcf.1/FCC8.g.vcf.gz --variant gvcf.1/FCC4.g.vcf.gz  --variant gvcf.1/F1a.g.vcf.gz  --variant gvcf.1/FGJ4.g.vcf.gz  --variant gvcf.1/FGJ10.g.vcf.gz  --variant gvcf.1/BCW1.g.vcf.gz  --variant gvcf.1/B1.g.vcf.gz  --variant gvcf.1/KNAM_0030.g.vcf.gz  --variant gvcf.1/FGJ6.g.vcf.gz  --variant gvcf.1/KNAM_0041.g.vcf.gz  --variant gvcf.1/KNAM_0029.g.vcf.gz  --variant gvcf.1/KNAM_0044.g.vcf.gz  --variant gvcf.1/MS_C_C1.g.vcf.gz  --variant gvcf.1/KNAM_0042.g.vcf.gz  --variant gvcf.1/KNAM_0045.g.vcf.gz  --variant gvcf.1/KNAM_0040.g.vcf.gz  --variant gvcf.1/FGJ12.g.vcf.gz  --variant gvcf.1/KNAM_0039.g.vcf.gz  --variant gvcf.1/KNAM_0043.g.vcf.gz  --variant gvcf.1/MS_C_C8.g.vcf.gz  --variant gvcf.1/KNAM_0046.g.vcf.gz  --variant gvcf.1/MS_C_C5.g.vcf.gz  --variant gvcf.1/MS_C_C7.g.vcf.gz  --variant gvcf.1/MS_C_C2.g.vcf.gz  --variant gvcf.1/MS_R_R1.g.vcf.gz  --variant gvcf.1/FGJ7.g.vcf.gz  --variant gvcf.1/MS_C_C3.g.vcf.gz  --variant gvcf.1/MS_C_C4.g.vcf.gz  --variant gvcf.1/MS_C_C9.g.vcf.gz  --variant gvcf.1/KNAM_0047.g.vcf.gz  --variant gvcf.1/FGJ3.g.vcf.gz  --variant gvcf.1/MS_C_C6.g.vcf.gz  --variant gvcf.1/FGJ5.g.vcf.gz  --variant gvcf.1/MS_R_R6.g.vcf.gz  --variant gvcf.1/KNAM_0048.g.vcf.gz  --variant gvcf.1/MS_R_R3.g.vcf.gz  --variant gvcf.1/FGJ8.g.vcf.gz  --variant gvcf.1/FGJ9.g.vcf.gz  --variant gvcf.1/MS_R_R7.g.vcf.gz  --variant gvcf.1/MS_R_R4.g.vcf.gz  --variant gvcf.1/MS_R_R9.g.vcf.gz  --variant gvcf.1/M1a.g.vcf.gz  --variant gvcf.1/MS_R_R2.g.vcf.gz  --variant gvcf.1/FGJ2.g.vcf.gz --variant gvcf.2/FL.17.g.vcf.gz --variant gvcf.2/FG4.g.vcf.gz --variant gvcf.2/FL.16.g.vcf.gz --variant gvcf.2/FL.18.g.vcf.gz --variant gvcf.2/FL.20.g.vcf.gz --variant gvcf.2/FL.19.g.vcf.gz --variant gvcf.2/FG2.g.vcf.gz --variant gvcf.2/FG3.g.vcf.gz --variant gvcf.2/G_1.1.g.vcf.gz --variant gvcf.2/G_1.2.g.vcf.gz --variant gvcf.2/G_2.2.g.vcf.gz --variant gvcf.2/PR12.g.vcf.gz --variant gvcf.2/G_2.3.g.vcf.gz --variant gvcf.2/PR14.g.vcf.gz --variant gvcf.2/PR15.g.vcf.gz --variant gvcf.2/PR16.g.vcf.gz --variant gvcf.2/PR18.g.vcf.gz --variant gvcf.2/PR1.g.vcf.gz --variant gvcf.2/PR19.g.vcf.gz --variant gvcf.2/PR27.g.vcf.gz --variant gvcf.2/PR31.g.vcf.gz --variant gvcf.2/PR32.g.vcf.gz --variant gvcf.2/PR30.g.vcf.gz --variant gvcf.2/PR29.g.vcf.gz --variant gvcf.2/PR33.g.vcf.gz --variant gvcf.2/PR35.g.vcf.gz --variant gvcf.2/PR5.g.vcf.gz -O /home/knam/work/sfrugiperda_SNP/mt/mergedgvcf/merged.all.g.vcf.gz









