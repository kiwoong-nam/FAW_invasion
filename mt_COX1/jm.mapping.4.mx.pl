use strict;

my $outputD='/home/knam/work/sfrugiperda_SNP/mt/script/mapping.4';

my $fqD="/home/knam/work/processing_fq/laneseq_201909/processed/MEX";
opendir my $D,$fqD;
my @files=readdir($D);
close $D;

my @samples;
foreach my $file (@files) {if($file=~/MEX/) {push @samples,$file}}

my $template=
'#!/bin/bash
#SBATCH --mem=20G

cd /home/knam/work/sfrugiperda_SNP/mt/ref

/home/knam/save/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2 -x sfmt -1 /home/knam/work/processing_fq/laneseq_201909/processed/MEX/SAMPLE/SAMPLE.pair1.truncated.gz -2 /home/knam/work/processing_fq/laneseq_201909/processed/MEX/SAMPLE/SAMPLE.pair2.truncated.gz | /home/knam/save/programs/samtools-1.9/samtools view -F 4 -b -h -o ../bam.4/SAMPLE.raw.bam

cd ../bam.4

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

	open my $fd,">$outputD/j.mex$n";
	print $fd $j;
	close $fd;
	$n++;

	print "sbatch $outputD/j.mex$n\n";
}


