use strict;

for(my $i=1;$i<496;$i++)
{
	my $j="#!/bin/bash
#SBATCH --mem=40G

cd  /home/knam/work/sfrugiperda_SNP/Invasive/vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -R ../ref/$i.fa -select-type SNP -V $i.vcf.gz -O $i.SNP.vcf.gz
";

	open my $fd,">/home/knam/work/sfrugiperda_SNP/Invasive/script/snpcollect/j$i";
	print $fd $j;
	close $fd;

	print "sbatch j$i\n";
	
}

