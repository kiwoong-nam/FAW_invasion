use strict;

my $inputvcf=shift;
my $inputgenotype=shift;
my $resultF=shift;

my %dist;
my $n=0;
my $nsamples;
my %results;

open(IN, "zcat $inputvcf |");
L:while (<IN>)
{
	$_=~s/\n//g;
	my @single=split("\t",$_);

	if($_=~/CHROM/)
	{
		for(my $i=0;$i<9;$i++) {shift @single}
		$nsamples=($#single+1);		
	}
	if($_!~/#/) {last L}
}
close (IN);

open(IN, "zcat $inputgenotype | ");
while(<IN>)
{
	$_=~s/\n//;
	my @genotypes=split('',$_);
	for(my $i=0;$i<=$#genotypes;$i++)
	{
		for(my $j=0;$j<=$#genotypes;$j++)
		{
			my $key="$i\_$j";
			my $diff=($genotypes[$i]-$genotypes[$j]);
			$dist{$key}+=($diff*$diff);
		}
	}

	$n++;

	if($n%1000==0)
	{
		print ($n/1.5e6,"\n");

		savedata();
		undef %dist;
	}
}
close(IN);

#savedata();

my @idx=sort {$a cmp $b} keys %results;
my $res;
foreach my $id (@idx)
{
	$results{$id}=~s/\t$/\n/;
	$res.="$id\t$results{$id}";
}

open my $fd,">$resultF";
print $fd $res;
close $fd;

print "the number of positions:$n\n";


###########################################

sub savedata
{
	for(my $i=0;$i<$nsamples;$i++)
	{
		for(my $j=0;$j<$nsamples;$j++)
		{
			my $key="$i\_$j";
			$results{$key}.="$dist{$key}\t";
		}
	}

	my @idx=sort {$a cmp $b} keys %results;

	my $res;
	foreach my $id (@idx)
	{
        	$res.="$id\t$results{$id}\n";
	}

	$res=~s/\tt\n/\n/g;

	open my $fd,">$resultF";
	print $fd $res;
	close $fd;
}


