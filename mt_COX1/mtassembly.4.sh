#!/bin/bash

SP=("ACH10" "ACH11" "ACH12" "ACH13" "ACH14" "ACH15" "ACH16" "ACH17" "ACH18" "ACH19" "ACH1" "ACH20" "ACH21" "ACH22" "ACH23" "ACH24" "ACH25" "ACH26" "ACH27" "ACH28" "ACH2" "ACH31" "ACH32" "ACH33" "ACH34" "ACH35" "ACH36" "ACH37" "ACH38" "ACH4" "ACH5" "ACH6" "ACH7" "ACH8" "ACH9" "ARH10" "ARH11" "ARH12" "ARH13" "ARH14" "ARH15" "ARH16" "ARH17" "ARH18" "ARH19" "ARH1" "ARH20" "ARH21" "ARH22" "ARH2" "ARH3" "ARH4" "ARH7" "ARH8" "MEX13" "MEX15" "MEX16" "MEX18" "MEX21" "MEX23" "MEX25" "MEX27" "MEX28" "MEX29" "MEX31" "MEX33" "MEX35" "MEX38" "MEX6" "MEX8" "MEX9")

source activate mitozEnv

cd /media/kiwoong/c4a81c8c-7d02-476b-82c1-ecc5538cdcae/sfrugiperda_SNP/mt/mtassembly


for i in "${SP[@]}"
do
   mkdir $i
   cd $i

   python3 ~/bioinformatics/MitoZ-master/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all2 --outprefix $i --thread_number 1 --fastq1 ../../mtfq.4/$i.filtered.paired.1.fq.gz --fastq2 ../../mtfq.4/$i.filtered.paired.2.fq.gz --fastq_read_length 150 --insert_size 300
   cd ..
done







