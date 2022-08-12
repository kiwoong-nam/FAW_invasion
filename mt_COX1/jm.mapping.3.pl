use strict;

my $outputD='/home/knam/work/sfrugiperda_SNP/mt/script/mapping.3';
my @samples=qw(142m 174F 293m 331a 334A 336K 337K 340k 345K 346M 353m 56F C1 CC38 CC40 CC41 CC44 CC66 CC68 CC69 CC77 CC96 KAB KAT KUM Mal11 Mal12 Mal17 Mal18 Mal19 Mal1sb Mal1 Mal21 Mal22 Mal26 Mal2sb Mal2 Mal31 Mal32 Mal3sb Mal41 Mal42 Mal46 Mal47 Mal51 Mal52 Mal6 Mal7 MIX5 MIX6 NGO rCC1 rCC20 rCC25 rCC5);

my $template=
'#!/bin/bash
#SBATCH --mem=20G

cd /home/knam/work/sfrugiperda_SNP/mt/ref

/home/knam/save/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2 -x sfmt -1 /home/knam/work/processing_fq/sfrugi_AUS/processed/SAMPLE.pair1.truncated.gz -2 /home/knam/work/processing_fq/sfrugi_AUS/processed/SAMPLE.pair2.truncated.gz | /home/knam/save/programs/samtools-1.9/samtools view -F 4 -b -h -o ../bam.3/SAMPLE.raw.bam

cd ../bam.3

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


