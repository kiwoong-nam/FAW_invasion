use strict;

my $gffF='/home/kiwoong/Projects/sfrugi_invasive/Hapflk/genes/sf7.gff3.gz';
my $outlierF='/home/kiwoong/Projects/sfrugi_invasive/SweeD/PSsites.txt';
my $output='/home/kiwoong/Projects/sfrugi_invasive/SweeD/PSgene.txt';
my $tempF='/home/kiwoong/Projects/sfrugi_invasive/SweeD/temp';

`zcat $gffF > $tempF`;

my %OTL;
open my $fd,$outlierF;
while(<$fd>)
{
	if($_=~/likelihood/) {next}
	$_=~s/\n//g;
	my @single=split("\t",$_);

	for(my $i=$single[1];$i<=$single[2];$i++)
	{
		my $key="$single[0]\t$i";
		$OTL{$key}=$single[0];
	}
}
close $fd;

my $res;
open my $fd,$tempF;
while(<$fd>)
{
	if($_!~/\tgene\t/) {next}
	$_=~s/\n//;
	$_=~s/HiC_scaffold_//;
	
	my @single=split("\t",$_);

	$single[8]=~s/\w+=//g;
	my @sl=split(';',$single[8]);
	my $information="$single[0]\t$single[3]\t$single[4]\t$sl[0]\t$sl[3]\n";

	my $inclus='no';
	L:for(my $i=$single[3];$i<=$single[4];$i++)
	{
		my $key="$single[0]\t$i";
		if($OTL{$key} ne "")
		{
			$inclus = $OTL{$key};
			last L;
		}
	}
	
	if($inclus ne "no") { $res.=$information}
}
close $fd;

open my $fd,">$output";
print $fd $res;
close $fd;

`rm $tempF`;

