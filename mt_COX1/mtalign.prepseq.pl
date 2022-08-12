use strict;

my $indir='/home/kiwoong/Projects/sfrugiperda_SNP/mt/mtassembly';
my $outdir='/home/kiwoong/Projects/sfrugiperda_SNP/mt/mtalignment/beforealign';

my @genes=qw(COX1 COX2 COX3 CYTB ATP6 ATP8 ND1 ND2 ND3 ND4 ND4L ND5 ND6);
my @samples_1=qw(B1 B5 BCW2 FCC1 FCC8 FGJ3 FGJ9 KNAM_0037 KNAM_0043 M1a MS_C_C6 MS_R_R3 MS_R_R9 B10 B6 BRG1 FCC2 FGJ1 FGJ4 KNAM_0029 KNAM_0038 KNAM_0044 MS_C_C1 MS_C_C7 MS_R_R4 B12 B7 BRG2 FCC3 FGJ10 FGJ5 KNAM_0030 KNAM_0039 KNAM_0045 MS_C_C2 MS_C_C8 MS_R_R5 S3 B2 B8 BRG3 FCC4 FGJ11 FGJ6 KNAM_0034 KNAM_0040 KNAM_0046 MS_C_C3 MS_C_C9 MS_R_R6 B3 B9  FCC6 FGJ12 FGJ7 KNAM_0035 KNAM_0041 KNAM_0047 MS_C_C4 MS_R_R1 MS_R_R7 B4 BCW1 F1a FCC7 FGJ2 FGJ8 KNAM_0036 KNAM_0042 KNAM_0048 MS_C_C5 MS_R_R2 MS_R_R8);

my @samples_2=qw(S_exempta pectinicornis S_latifascia S_litto S_albula S_mauritia exigua S_depravata S_ochrea S_dolichos S_ornithogalli picta MS_C_C2 MS_R_R2);

exe(\@samples_1,'frugi');
exe(\@samples_2,'spodo');

sub exe
{
	(my $samples,my $tag)=(@_);

	my %alignments;

	foreach my $sp (@$samples)
	{
		my $input="$indir/$sp/$sp.result/$sp.cds";

		my %seqs;
		my $sq;
		my $geneN;
		open my $fd,$input;
		while(<$fd>)
		{
			$_=~s/\n//;
			if($_=~/>.*;(.*);.*;.*$/)
			{
				unless($sq eq "") {$seqs{$geneN}=$sq}
				undef $geneN;
				undef $sq;
				$geneN=$1;
			}
			else { $sq.=$_}
		}
		close $fd;
		$seqs{$geneN}=$sq;
	
		my @genes=keys %seqs;
	
		foreach my $gene (@genes)
		{
			unless($seqs{$gene} eq '') { $alignments{$gene}.=">$sp\n$seqs{$gene}\n"}
		}
	}

	foreach my $gene (@genes)
	{
		open my $fd,">$outdir/$tag.$gene.fas";
		print $fd $alignments{$gene};
		close $fd;
	
	#	`/home/kiwoong/bioinformatics/muscle3.8.31_i86linux64 -in $outdir1/$gene.fas -out $outdir2/$gene.fas`;

	}
}





