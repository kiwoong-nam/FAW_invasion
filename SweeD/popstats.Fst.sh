#!/bin/bash

cd /media/kiwoong/8b812224-6abf-42c2-bccd-002032c3aec1/sfrugi_invasive/SweeD/popstats

~/bioinformatics/vcftools_0.1.13/bin/vcftools --gzvcf /media/kiwoong/8b812224-6abf-42c2-bccd-002032c3aec1/sfrugi_invasive/SNP/vcf/Invasive.SNP.filtered.vcf.gz --weir-fst-pop /media/kiwoong/8b812224-6abf-42c2-bccd-002032c3aec1/sfrugi_invasive/Hapflk/popinfo/Pop1.txt --weir-fst-pop /media/kiwoong/8b812224-6abf-42c2-bccd-002032c3aec1/sfrugi_invasive/Hapflk/popinfo/Pop2.txt --fst-window-size 100000 --out P12

