#!/bin/bash

SP=( "BRG1" "BRG2" "BRG3" "KNAM_0037" "B10" "B12" "B1" "B2" "B3" "B4" "B5" "B6" "B7" "B8" "B9" "BCW1" "BCW2" "F1a" "FCC1" "FCC2" "FCC3" "FCC4" "FCC6" "FCC7" "FCC8" "FGJ10" "FGJ11" "FGJ12" "FGJ1" "FGJ2" "FGJ3" "FGJ4" "FGJ5" "FGJ6" "FGJ7" "FGJ8" "FGJ9" "KNAM_0029" "KNAM_0030" "KNAM_0034" "KNAM_0035" "KNAM_0036" "KNAM_0038" "KNAM_0039" "KNAM_0040" "KNAM_0041" "KNAM_0042" "KNAM_0043" "KNAM_0044" "KNAM_0045" "KNAM_0046" "KNAM_0047" "KNAM_0048" "M1a" "MS_C_C1" "MS_C_C2" "MS_C_C3" "MS_C_C4" "MS_C_C5" "MS_C_C6" "MS_C_C7" "MS_C_C8" "MS_C_C9" "MS_R_R1" "MS_R_R2" "MS_R_R3" "MS_R_R4" "MS_R_R5" "MS_R_R6" "MS_R_R7" "MS_R_R8" "MS_R_R9" "S3")

source activate mitozEnv

cd /home/kiwoong/Projects/sfrugiperda_SNP/mt/mtassembly

for i in "${SP[@]}"
do
   mkdir $i
   cd $i

   python3 ~/bioinformatics/MitoZ-master/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all2 --outprefix $i --thread_number 1 --fastq1 ../../../../mtfq.1/$i.filtered.paired.1.fq.gz --fastq2 ../../../../mtfq.1/$i.filtered.paired.2.fq.gz --fastq_read_length 150 --insert_size 300
   cd ..
done


