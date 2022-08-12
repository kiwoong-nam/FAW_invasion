#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/script

perl reducedvcf.pl /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/vcf/Outgrouped.vcf.gz /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable/reducedvcf

perl calcdist.pl /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/vcf/Outgrouped.vcf.gz /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable/reducedvcf.gz /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable/dist.txt

perl distmatrix.pl /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/vcf/Outgrouped.vcf.gz /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable/dist.txt /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable/Native_outgroup. 1000

cd /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable

sed 's/SRR5132437/S_litura  /' Native_outgroup.boot.tre > boot.tbl
sed 's/SRR5132437/S_litura  /' Native_outgroup.bg.tre > bg.tbl

cd /home/kiwoong/Projects/sfrugi_invasive/Tree_outgroup/disttable

/home/kiwoong/bioinformatics/fastme-2.1.5/binaries/fastme-2.1.5-linux64 -i bg.tbl -o bg.tre
/home/kiwoong/bioinformatics/fastme-2.1.5/binaries/fastme-2.1.5-linux64 -i boot.tbl -o boot.tre -D 1000

cp boot.tre intree

echo -ne 'Y' | /home/kiwoong/bioinformatics/phylip-3.697/exe/consense 


