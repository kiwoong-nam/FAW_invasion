#!/usr/bin/perl
use strict;

my @samples=qw(FG2 FG3 FG4 FL.16 FL.17 FL.18 FL.19 FL.20 G_1.1 G_1.2 G_2.2 G_2.3 PR12 PR14 PR15 PR16 PR18 PR19 PR1 PR27 PR29 PR30 PR31 PR32 PR33 PR35 PR5);

my $indir='/home/knam/work/sfrugiperda_SNP/mt/bam.2';
my $outdir='/home/knam/work/sfrugiperda_SNP/mt/mtfq.2';

foreach my $sample (@samples)
{
	my $fileIN="$indir/$sample.bam";
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



