#!/bin/bash

SP=("FG2" "FG3" "FG4" "FL.16" "FL.17" "FL.18" "FL.19" "FL.20" "G_1.1" "G_1.2" "G_2.2" "G_2.3" "PR12" "PR14" "PR15" "PR16" "PR18" "PR19" "PR1" "PR27" "PR29" "PR30" "PR31" "PR32" "PR33" "PR35" "PR5");


source activate mitozEnv

cd /home/kiwoong/Projects/sfrugiperda_SNP/mt/mtassembly

for i in "${SP[@]}"
do
   mkdir $i
   cd $i

   python3 ~/bioinformatics/MitoZ-master/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all2 --outprefix $i --thread_number 1 --fastq1 ../../../../mtfq.2/$i.filtered.paired.1.fq.gz --fastq2 ../../../../mtfq.2/$i.filtered.paired.2.fq.gz --fastq_read_length 150 --insert_size 300
   cd ..
done


