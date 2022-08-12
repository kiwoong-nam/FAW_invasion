#!/bin/bash

pN=p2
pop=/home/knam/work/sfrugi_Invasive/SweeD/popinfo/Pop2.txt
tempF=/home/knam/work/sfrugi_Invasive/SweeD/result/p2.vcf

vcfF=/home/knam/work/sfrugi_Invasive/SNP/vcf/Invasive.SNP.filtered.vcf.gz

module load bioinfo/tabix-0.2.5 
module load bioinfo/vcftools-0.1.15

cd /home/knam/work/sfrugi_Invasive/SweeD/result

zcat $vcfF | head -n 1000 | vcftools --vcf - --keep $pop -c --recode  | grep '#' > $tempF

for i in {1..29}
do
  echo $i
  chrN=HiC_scaffold_$i
  tabix -h $vcfF $chrN | sed 's/HiC_scaffold_//' | grep -v '*' | grep -Pv '\t\.:' | vcftools --vcf - --keep $pop -c --recode  | grep -v '#' >> $tempF
done




