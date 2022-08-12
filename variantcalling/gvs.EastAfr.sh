#!/bin/bash
#SBATCH --mem=60G

cd /home/knam/work/sfrugiperda_SNP/mergedgvcf

/home/knam/save/programs/gatk-4.1.2.0/gatk CombineGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -O merged.EastAfr.g.vcf.gz  --variant ../nuc_3/gvcf/Mal12.g.vcf.gz --variant ../nuc_3/gvcf/Mal17.g.vcf.gz --variant ../nuc_3/gvcf/Mal1.g.vcf.gz --variant ../nuc_3/gvcf/Mal21.g.vcf.gz --variant ../nuc_3/gvcf/Mal22.g.vcf.gz --variant ../nuc_3/gvcf/Mal26.g.vcf.gz --variant ../nuc_3/gvcf/Mal2.g.vcf.gz --variant ../nuc_3/gvcf/Mal31.g.vcf.gz --variant ../nuc_3/gvcf/Mal32.g.vcf.gz --variant ../nuc_3/gvcf/Mal41.g.vcf.gz --variant ../nuc_3/gvcf/Mal42.g.vcf.gz --variant ../nuc_3/gvcf/Mal46.g.vcf.gz --variant ../nuc_3/gvcf/Mal51.g.vcf.gz --variant ../nuc_3/gvcf/Mal52.g.vcf.gz --variant ../nuc_3/gvcf/Mal6.g.vcf.gz --variant ../nuc_3/gvcf/Mal7.g.vcf.gz --variant ../nuc_3/gvcf/142m.g.vcf.gz --variant ../nuc_3/gvcf/174F.g.vcf.gz --variant ../nuc_3/gvcf/293m.g.vcf.gz --variant ../nuc_3/gvcf/KAB.g.vcf.gz --variant ../nuc_3/gvcf/KAT.g.vcf.gz --variant ../nuc_3/gvcf/KUM.g.vcf.gz --variant ../nuc_3/gvcf/NGO.g.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa --variant merged.EastAfr.g.vcf.gz  -O ../vcf/EastAfr.vcf.gz  -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugiperda_SNP/nuc_1/ref/sfC.ver7.fa -V EastAfr.vcf.gz -O EastAfr.SNP.vcf.gz


