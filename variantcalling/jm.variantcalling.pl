use strict;

for(my $i=1;$i<496;$i++)
{
	my $j="#!/bin/bash
#SBATCH --mem=40G

cd  /home/knam/work/sfrugiperda_SNP/Invasive/ref

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R $i.fa --variant /home/knam/work/sfrugiperda_SNP/mergedgvcf/merged.Invasive.g.vcf.gz -O ../vcf/$i.vcf.gz -all-sites
";

	open my $fd,">/home/knam/work/sfrugiperda_SNP/Invasive/script/variantcalling/j$i";
	print $fd $j;
	close $fd;
}

