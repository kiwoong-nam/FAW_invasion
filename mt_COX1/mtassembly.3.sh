#!/bin/bash

SP=("S_litto" "pectinicornis" "S_albula" "S_depravata" "S_dolichos" "S_exempta" "S_latifascia" "S_mauritia"  "S_ochrea" "S_ornithogalli" "exigua")

source activate mitozEnv

cd /home/kiwoong/Projects/sfrugiperda_SNP/mt/mtassembly

for i in "${SP[@]}"
do
   mkdir $i
   cd $i

   python3 ~/bioinformatics/MitoZ-master/version_2.4-alpha/release_MitoZ_v2.4-alpha/MitoZ.py all2 --outprefix $i --thread_number 1 --fastq1 ../../../../mtfq.3/$i.filtered.paired.1.fq.gz --fastq2 ../../../../mtfq.3/$i.filtered.paired.2.fq.gz --fastq_read_length 150 --insert_size 300
   cd ..
done



