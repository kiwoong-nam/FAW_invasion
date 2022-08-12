use strict;

my @samples=qw(B1 B10 B12 B2 B3 B4 B5 B6 B7 B8 B9 BCW1 BCW2 F1a FCC1 FCC2 FCC3 FCC4 FCC6 FCC7 FCC8 FG2 FG3 FG4 FGJ10 FGJ11 FGJ12 FGJ2 FGJ3 FGJ4 FGJ5 FGJ6 FGJ7 FGJ8 FGJ9 FL.16 FL.17 FL.18 FL.19 FL.20 G_1.1 G_1.2 G_2.2 G_2.3 KNAM_0029 KNAM_0030 KNAM_0039 KNAM_0040 KNAM_0041 KNAM_0042 KNAM_0043 KNAM_0044 KNAM_0045 KNAM_0046 KNAM_0047 KNAM_0048 M1a MS_C_C1 MS_C_C2 MS_C_C3 MS_C_C4 MS_C_C5 MS_C_C6 MS_C_C7 MS_C_C8 MS_C_C9 MS_R_R1 MS_R_R2 MS_R_R3 MS_R_R4 MS_R_R5 MS_R_R6 MS_R_R7 MS_R_R8 MS_R_R9 PR1 PR12 PR14 PR15 PR16 PR18 PR19 PR27 PR29 PR30 PR31 PR32 PR33 PR35 PR5 S3);
 
foreach my $s (@samples)
{
	print "$s\n";

	my $input="/home/kiwoong/Projects/sfrugiperda_SNP/mt/mtassembly/$s/$s.result/work71.mitogenome.fa";

	my $seq;
	my %SQs;
	open my $fd,$input;
	while(<$fd>)
	{
		if($_=~/>/)
		{
			my $k=length $seq;
			$SQs{$k}=$seq;
			undef $seq;
			next;
		}
		$_=~s/\n//;
		$seq.=$_;
	}
	close $fd;

	my $k=length $seq;
	$SQs{$k}=$seq;

	my @lengts=sort {$b <=> $a} keys %SQs;
	print "@lengts\n";next;

	my $T=0;
	while($seq=~/T/g){$T++}

	if($T>10000)
	{
		$seq=reverse $seq;
		$seq=~tr/ATGC/TACG/;

		print "$s $T ::: ";
		my $A=0;
		while($seq=~/T/g){$T++}
		while($seq=~/A/g){$A++}

#		print "$s $A $T\n";
	}
}

