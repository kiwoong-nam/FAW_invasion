#!/bin/bash

cd /home/knam/work/sfrugiperda_SNP/mt/ref

/home/knam/save/programs/gatk-4.1.2.0/gatk CreateSequenceDictionary -R=sfmt.ref.smrt.fa -O=sfmt.ref.smrt.dict

/home/knam/save/programs/samtools-1.9/samtools faidx sfmt.ref.smrt.fa


