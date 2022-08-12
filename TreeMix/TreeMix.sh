#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_invasive/TreeMIX/result

for i in {0..6}
do
 /home/kiwoong/bioinformatics/treemix/src/treemix -i ../data/Outgrouped.treemix.frq.gz -o Outgrouped.$i -root litura -k 500 -m $i
done


