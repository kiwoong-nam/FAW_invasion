use strict;

my $indir='/media/kiwoong/c4a81c8c-7d02-476b-82c1-ecc5538cdcae/sfrugiperda_SNP/mt/mtassembly';
my $outF1='/media/kiwoong/c4a81c8c-7d02-476b-82c1-ecc5538cdcae/sfrugiperda_SNP/mt/mtalignment.all/beforealign_COX1.fas';
my $outF2='/media/kiwoong/c4a81c8c-7d02-476b-82c1-ecc5538cdcae/sfrugiperda_SNP/mt/mtalignment.all/afteralign_COX1.fas';

opendir my $D,$indir;
my @files=readdir($D);
close $D;

my $beforeA;

foreach my $sp (@files)
{
	if($sp =~/\.$/) {next}

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

	my $co1seq=$seqs{"COX1"};
	$beforeA.=">$sp\n$co1seq\n";
}

open my $fd,">$outF1";
print $fd $beforeA;
close $fd;

print "ls $outF1\n";

`/home/kiwoong/bioinformatics/muscle3.8.31_i86linux64 -in $outF1 -out $outF2`;

