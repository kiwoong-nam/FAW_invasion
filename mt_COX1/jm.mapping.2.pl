use strict;

my $outputD='/home/knam/work/sfrugiperda_SNP/mt/script/mapping.2';
my @samples=qw(FG2 FG3 FG4 FL.16 FL.17 FL.18 FL.19 FL.20 G_1.1 G_1.2 G_2.2 G_2.3 PR12 PR14 PR15 PR16 PR18 PR19 PR1 PR27 PR29 PR30 PR31 PR32 PR33 PR35 PR5);

my $template=
'#!/bin/bash

#SBATCH --mem=50G

cd /home/knam/work/sfrugiperda_SNP/mt/ref

/home/knam/save/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2 -x sfmt -1 /home/knam/save/fq/SAMPLE.filtered.paired.1.fq.gz -2 /home/knam/save/fq/SAMPLE.filtered.paired.2.fq.gz | /home/knam/save/programs/samtools-1.9/samtools view -F 4 -b -h -o ../bam.2/SAMPLE.raw.bam

cd ../bam.2

/home/knam/save/programs/samtools-1.9/samtools sort -o SAMPLE.sorted.bam SAMPLE.raw.bam

#rm SAMPLE.raw.bam

java -Xmx10g -Djava.io.tmpdir=temp.SAMPLE -jar /home/knam/save/programs/picard.jar MarkDuplicates INPUT=SAMPLE.sorted.bam OUTPUT=SAMPLE.dupl_rm.bam REMOVE_DUPLICATES=true METRICS_FILE=SAMPLE.metricN.log ASSUME_SORTED=True MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 

#rm -rf temp.SAMPLE
#rm SAMPLE.sorted.bam

java -Xmx10g -Djava.io.tmpdir=temp.SAMPLE -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT=SAMPLE.dupl_rm.bam OUTPUT=SAMPLE.bam RGID=SAMPLE RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=SAMPLE;

#rm -rf temp.SAMPLE
#rm SAMPLE.dupl_rm.bam

#/home/knam/save/programs/samtools-1.9/samtools index SAMPLE.bam
#/home/knam/save/programs/samtools-1.9/samtools stats SAMPLE.bam > SAMPLE.stats
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


