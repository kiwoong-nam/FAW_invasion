use strict;

my $inputvcf=shift;
my $distF=shift;
my $output=shift;
my $B=shift;

my $bg_output=$output.'bg.tre';
my $boot_output=$output.'boot.tre';

my @names;
my $nsamples;

open(IN, "zcat $inputvcf |");
L:while (<IN>)
{
	$_=~s/\n//g;
	my @single=split("\t",$_);

	if($_=~/CHROM/)
	{
		for(my $i=0;$i<9;$i++) {shift @single}
		foreach my $s (@single)
		{
			my $ns=10-(length $s);
			for(my $i=0;$i<$ns;$i++) {$s.=" "}
			push @names,$s;
		}
		$nsamples=($#single+1);		
	}
	if($_!~/#/) {last L}
}
close (IN);

open my $fd,$distF;
my @ddata=<$fd>;
close $fd;

my @K;
my @dists;
foreach my $line (@ddata)
{
	$line=~s/\n//;
	my @single=split("\t",$line);
	my $key=shift @single;
	push @K,$key;

	for(my $i=0;$i<=$#single;$i++)	{$dists[$i].="$single[$i]\t"}
}

foreach my $line (@dists) {$line=~s/\t$//}

####

my $minput;
for(my $b=0;$b<$B;$b++)
{
	print "$b\n";
	my %DIST;
	for(my $i=0;$i<=$#dists;$i++)
	{
		my @s=split("\t",$dists[int rand $#dists]);
		
		for(my $j=0;$j<=$#s;$j++) {$DIST{$K[$j]}+=$s[$j]}
	}

	my $iutput="   $nsamples\n";
	for(my $i=0;$i<$nsamples;$i++)
	{
		my $res=$names[$i];
		for(my $j=0;$j<$nsamples;$j++)
		{
			my $key="$i\_$j";
			my $d=int((sqrt $DIST{$key})*10000)/10000;
			$res.="$d ";
		}	
		$res=~s/ $/\n/;
		$iutput.=$res;
	}

	$minput.=$iutput;
}

open my $fd,">$boot_output";
print $fd $minput;
close $fd;

############################################"

print "bg\n";
my %DIST;

foreach my $line (@dists)
{
	my @s=split("\t",$line);
	for(my $j=0;$j<=$#s;$j++) {$DIST{$K[$j]}+=$s[$j]}
}

my $iutput="   $nsamples\n";
for(my $i=0;$i<$nsamples;$i++)
{
	my $res=$names[$i];
	for(my $j=0;$j<$nsamples;$j++)
	{
		my $key="$i\_$j";
		my $d=int((sqrt $DIST{$key})*10000)/10000;
		$res.="$d ";
	}	
	$res=~s/ $/\n/;
	$iutput.=$res;
}

open my $fd,">$bg_output";
print $fd $iutput;
close $fd;



