#!/bin/bash
#SBATCH --mem=100G

cd /home/knam/work/sfrugi_Invasive/Kiwoong/Admixture/result
/home/knam/save/programs/admixture_linux-1.3.0/admixture /home/knam/work/sfrugi_Invasive/Kiwoong/Admixture/input/invasive.bed 2 --cv > admixture.2.log

