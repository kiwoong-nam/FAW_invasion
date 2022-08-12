#!/bin/bash
#SBATCH -c 10

pN=p2
tempF=/home/knam/work/sfrugi_Invasive/SweeD/result/p2.vcf

cd /home/knam/work/sfrugi_Invasive/SweeD/result

/home/knam/save/programs/SweeD_v3.2.1_Linux/SweeD-P -name $pN -input $tempF -grid 1000 -threads 10




