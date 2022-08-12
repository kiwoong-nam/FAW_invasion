use strict;

my $outputD='/home/knam/work/sfrugiperda_SNP/mt/script/mapping.1';
my @samples=qw(B10 B12 B1 B2 B3 B4 B5 B6 B7 B8 B9 BCW1 BCW2 BRG1 BRG2 BRG3 F1a FCC1 FCC2 FCC3 FCC4 FCC5 FCC6 FCC7 FCC8 FGJ10 FGJ11 FGJ12 FGJ1 FGJ2 FGJ3 FGJ4 FGJ5 FGJ6 FGJ7 FGJ8 FGJ9 KNAM_0029 KNAM_0030 KNAM_0034 KNAM_0035 KNAM_0036 KNAM_0037 KNAM_0038 KNAM_0039 KNAM_0040 KNAM_0041 KNAM_0042 KNAM_0043 KNAM_0044 KNAM_0045 KNAM_0046 KNAM_0047 KNAM_0048 M1a MS_C_C1 MS_C_C2 MS_C_C3 MS_C_C4 MS_C_C5 MS_C_C6 MS_C_C7 MS_C_C8 MS_C_C9 MS_R_R1 MS_R_R2 MS_R_R3 MS_R_R4 MS_R_R5 MS_R_R6 MS_R_R7 MS_R_R8 MS_R_R9 S3);

my $template=
'#!/bin/bash

cd /home/knam/work/sfrugiperda_SNP/mt/ref

/home/knam/save/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2 -x sfmt -1 /home/knam/work/sfrugiperda_SNP/fq/SAMPLE.pair1.truncated.gz -2 /home/knam/work/sfrugiperda_SNP/fq/SAMPLE.pair2.truncated.gz | /home/knam/save/programs/samtools-1.9/samtools view -F 4 -b -h -o ../bam.1/SAMPLE.raw.bam

cd ../bam.1

/home/knam/save/programs/samtools-1.9/samtools sort -o SAMPLE.sorted.bam SAMPLE.raw.bam

rm SAMPLE.raw.bam

java -Xmx4g -Djava.io.tmpdir=temp.SAMPLE -jar /home/knam/save/programs/picard.jar MarkDuplicates INPUT=SAMPLE.sorted.bam OUTPUT=SAMPLE.dupl_rm.bam REMOVE_DUPLICATES=true METRICS_FILE=SAMPLE.metricN.log ASSUME_SORTED=True MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 

rm -rf temp.SAMPLE
rm SAMPLE.sorted.bam

java -Xmx4g -Djava.io.tmpdir=temp.SAMPLE -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT=SAMPLE.dupl_rm.bam OUTPUT=SAMPLE.bam RGID=SAMPLE RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=SAMPLE;

rm -rf temp.SAMPLE
rm SAMPLE.dupl_rm.bam

/home/knam/save/programs/samtools-1.9/samtools index SAMPLE.bam
/home/knam/save/programs/samtools-1.9/samtools stats SAMPLE.bam > SAMPLE.stats
';

my $n=0;

foreach my $sp (@samples)
{
	my $j=$template;
	$j=~s/SAMPLE/$sp/g;

	open my $fd,">$outputD/j$n";
	print $fd $j;
	close $fd;
	$n++;

	print "sbatch $outputD/j$n\n";
}


