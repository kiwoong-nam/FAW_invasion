#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_invasive/TreeMIX/data

cp /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/vcf/Outgrouped.vcf.gz .

bash ../script/vcf2treemix.sh Outgrouped.vcf.gz Outgrouped.clust

rm Outgrouped.vcf.gz

