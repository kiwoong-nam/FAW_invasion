use strict;

my $outD='/home/knam/work/sfrugiperda_SNP/mt/script/bam2gvcf.3';
my @ids=qw(142m 174F 293m 331a 334A 336K 337K 340k 345K 346M 353m 56F C1 CC38 CC40 CC41 CC44 CC66 CC68 CC69 CC77 CC96 KAB KAT KUM Mal11 Mal12 Mal17 Mal18 Mal19 Mal1sb Mal1 Mal21 Mal22 Mal26 Mal2sb Mal2 Mal31 Mal32 Mal3sb Mal41 Mal42 Mal46 Mal47 Mal51 Mal52 Mal6 Mal7 MIX5 MIX6 NGO rCC1 rCC20 rCC25 rCC5);

my $task="#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd /home/knam/work/sfrugiperda_SNP/mt/gvcf.3

/home/knam/save/programs/samtools-1.9/samtools index ../bam.3/KIWOONG.bam

/home/knam/save/programs/gatk-4.1.2.0/gatk HaplotypeCaller -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa -I ../bam.3/KIWOONG.bam -O KIWOONG.g.vcf.gz -ERC GVCF
";

my $j=0;
foreach my $id (@ids)
{
	my $job=$task;
	$job=~s/KIWOONG/$id/g;
	$j++;

	open my $fd,">$outD/j$j";
	print $fd $job;
	close $fd;

	print "sbatch $outD/j$j\n";
}

