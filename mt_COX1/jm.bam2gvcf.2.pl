use strict;

my $outD='/home/knam/work/sfrugiperda_SNP/mt/script/bam2gvcf.2';
my @ids=qw(FG2 FG3 FG4 FL.16 FL.17 FL.18 FL.19 FL.20 G_1.1 G_1.2 G_2.2 G_2.3 PR12 PR14 PR15 PR16 PR18 PR19 PR1 PR27 PR29 PR30 PR31 PR32 PR33 PR35 PR5);
my $task="#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G
#SBATCH -p unlimitq


cd /home/knam/work/sfrugiperda_SNP/mt/gvcf.2

/home/knam/save/programs/samtools-1.9/samtools index ../bam.2/KIWOONG.bam

/home/knam/save/programs/gatk-4.1.2.0/gatk HaplotypeCaller -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa -I ../bam.2/KIWOONG.bam -O KIWOONG.g.vcf.gz -ERC GVCF
#/home/knam/save/programs/htslib-1.9/bgzip -f KIWOONG.g.vcf
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

