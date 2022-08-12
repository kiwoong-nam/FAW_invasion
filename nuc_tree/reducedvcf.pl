use strict;

my $input=shift;
my $resultF=shift;

`rm $resultF`;

my $result;
my $n;

open(IN, "zcat $input |");
L:while (<IN>)
{
	$_=~s/\n//g;
	if($_=~/#/) {next}
	my @single=split("\t",$_);

	shift @single;
	shift @single;
	shift @single;
	my $ref=shift @single;
	my $alt=shift @single;
	if($alt=~/,/) {next}
	my $tstv=2;
	if($ref eq 'A' and $alt eq 'G') {$tstv=1}
	if($ref eq 'G' and $alt eq 'A') {$tstv=1}
	if($ref eq 'T' and $alt eq 'C') {$tstv=1}
	if($ref eq 'C' and $alt eq 'T') {$tstv=1}
	shift @single;
	shift @single;
	shift @single;
	shift @single;

	my $genotypes;
	for(my $i=0;$i<=$#single;$i++)
	{
		$single[$i]=~/^(\d)[\/|\|](\d)/;
		if($1 eq '')
		{
			$genotypes.='.';
		}
		else
		{
			my $geno=($1+$2)*$tstv;
			$genotypes.="$geno";
		}
	}

	unless($genotypes=~/^\./)
	{
		$result.="$genotypes\n";
	}
	$n++;

	if($n%10000==0)
	{
		open my $fd,">>$resultF";
		print $fd $result;		
		close $fd;

		undef $result;
		print ($n/1.5e6,"\n");
	}
}

print "\n$n\n";

open my $fd,">>$resultF";
print $fd $result;
close $fd;

`gzip -f $resultF`;

