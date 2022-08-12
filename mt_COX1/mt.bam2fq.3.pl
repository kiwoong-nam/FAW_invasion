#!/usr/bin/perl
use strict;

my @samples=qw(S_latifascia S_depravata S_ochrea S_dolichos exigua S_litto S_ornithogalli S_exempta S_albula pectinicornis S_mauritia);
#my @samples=qw(picta); added this later. The result is incldued in the result directory

my $indir='/home/knam/work/spodoptera_phylogenomics/mtTREE/bam';
my $outdir='/home/knam/work/sfrugiperda_SNP/mt/mtfq.3';

foreach my $sample (@samples)
{
	my $fileIN="$indir/$sample.sorted.bam";
	my $tempF1="$outdir/$sample.us.bam";
	my $tempF2="$outdir/$sample.filtered.fq.gz";
	my $fileOut1="$outdir/$sample.filtered.paired.1.fq";
	my $fileOut2="$outdir/$sample.filtered.paired.2.fq";

	`/home/knam/save/programs/samtools-1.9/samtools sort -n -o $tempF1 $fileIN`;
	`/home/knam/save/programs/samtools-1.9/samtools bam2fq $tempF1 | gzip -f > $tempF2`;

	`rm $fileOut1 $fileOut2`;

	my $n=0;
	my $single;

	my $name;
	my %RES_1;
	my %RES_2;
	my %Num;

	my $paireddata1;
	my $paireddata2;

	my $i=0;

	open(my $fd, "gunzip -c $tempF2 |");
	while(<$fd>)
	{
		$single.=$_;

		if($n%4==3)
		{
			if($single=~/\/1\n/) 
			{
				$RES_1{$name}.=$single;
			}
			if($single=~/\/2\n/) 
			{
				$RES_2{$name}.=$single;
			}

			if($Num{$name}==2)
			{
				$paireddata1.=$RES_1{$name};
				$paireddata2.=$RES_2{$name};

				undef $RES_1{$name};
				undef $RES_2{$name};

				$i++;
				if($i%10000==0)
				{
					open my $fdw,">>$fileOut1";
					print $fdw $paireddata1;
					close $fdw;

					open my $fdw,">>$fileOut2";
					print $fdw $paireddata2;
					close $fdw;

					undef $paireddata1;
					undef $paireddata2;

				}
			}

	
			undef $single;
		}

		if($n%4==0)
		{
			$_=~s/\n$//;
			$_=~/(^.*)\/\d$/;
	
			$name=$1;
	
			$Num{$name}++;
		}
		$n++;
	}
	close $fd;

	open my $fdw,">>$fileOut1";
	print $fdw $paireddata1;
	close $fdw;

	open my $fdw,">>$fileOut2";
	print $fdw $paireddata2;
	close $fdw;

	`gzip -f $fileOut1`;
	`gzip -f $fileOut2`;

	`rm $tempF1 $tempF2`;
#	exit;
}



