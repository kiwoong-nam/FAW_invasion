#!/usr/bin/perl
use strict;

my @samples=qw(B10 B12 B1 B2 B3 B4 B5 B6 B7 B8 B9 BCW1 BCW2 BRG1 BRG2 BRG3 F1a FCC1 FCC2 FCC3 FCC4 FCC6 FCC7 FCC8 FGJ10 FGJ11 FGJ12 FGJ1 FGJ2 FGJ3 FGJ4 FGJ5 FGJ6 FGJ7 FGJ8 FGJ9 KNAM_0029 KNAM_0030 KNAM_0034 KNAM_0035 KNAM_0036 KNAM_0037 KNAM_0038 KNAM_0039 KNAM_0040 KNAM_0041 KNAM_0042 KNAM_0043 KNAM_0044 KNAM_0045 KNAM_0046 KNAM_0047 KNAM_0048 M1a MS_C_C1 MS_C_C2 MS_C_C3 MS_C_C4 MS_C_C5 MS_C_C6 MS_C_C7 MS_C_C8 MS_C_C9 MS_R_R1 MS_R_R2 MS_R_R3 MS_R_R4 MS_R_R5 MS_R_R6 MS_R_R7 MS_R_R8 MS_R_R9 S3);

my $indir='/home/knam/work/sfrugiperda_SNP/mt/bam.1';
my $outdir='/home/knam/work/sfrugiperda_SNP/mt/mtfq.1';

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



