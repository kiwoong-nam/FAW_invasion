use strict;

my $outD='/home/knam/work/sfrugiperda_SNP/mt/script/bam2gvcf.1';

my @ids=qw(B10 B12 B1 B2 B3 B4 B5 B6 B7 B8 B9 BCW1 BCW2 BRG1 BRG2 BRG3 F1a FCC1 FCC2 FCC3 FCC4 FCC5 FCC6 FCC7 FCC8 FGJ10 FGJ11 FGJ12 FGJ1 FGJ2 FGJ3 FGJ4 FGJ5 FGJ6 FGJ7 FGJ8 FGJ9 KNAM_0029 KNAM_0030 KNAM_0034 KNAM_0035 KNAM_0036 KNAM_0037 KNAM_0038 KNAM_0039 KNAM_0040 KNAM_0041 KNAM_0042 KNAM_0043 KNAM_0044 KNAM_0045 KNAM_0046 KNAM_0047 KNAM_0048 M1a MS_C_C1 MS_C_C2 MS_C_C3 MS_C_C4 MS_C_C5 MS_C_C6 MS_C_C7 MS_C_C8 MS_C_C9 MS_R_R1 MS_R_R2 MS_R_R3 MS_R_R4 MS_R_R5 MS_R_R6 MS_R_R7 MS_R_R8 MS_R_R9 S3);

my $task="#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G
#SBATCH -p unlimitq

cd /home/knam/work/sfrugiperda_SNP/mt/gvcf.1

/home/knam/save/programs/gatk-4.1.2.0/gatk HaplotypeCaller -R /home/knam/work/sfrugiperda_SNP/mt/ref/sfmt.ref.smrt.fa -I ../bam.1/KIWOONG.bam -O KIWOONG.g.vcf.gz -ERC GVCF
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

