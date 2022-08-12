use strict;

my $Wdir='/home/kiwoong/Projects/sfrugi_invasive/SweeD/result';

exet('p1');
exet('p2');

sub exet
{
	(my $name)=(@_); 

	my $infoF="$Wdir/SweeD_Info.$name";
	my $reportF="$Wdir/SweeD_Report.$name";
	my $output="$Wdir/SweeD_parsed.$name";

	my @chrN=(-1);
	open my $fd,$infoF;
	while(<$fd>)
	{
		if($_=~/Chromosome:/)
		{
			$_=~s/$&//;
			$_=~s/\s{1,}//g;
			push @chrN,$_;
		}
	}
	close $fd;

	my $chrN;
	my %RES;
	open my $fd,$reportF;
	while(<$fd>)
	{
		if($_=~/\/\//)
		{
			$_=~s/$&//;
			$_=~s/\s{1,}//g;
			$chrN=$chrN[$_];
		}
		elsif($_=~/Position/) {next}
		elsif($_=~/\w/) {$RES{$chrN}.="$chrN\t$_"}
	}
	close $fd;

	my $res="chrN\tpos\tlikelihood\talpha\n";
	for(my $i=1;$i<30;$i++) {$res.=$RES{$i}}

	undef %RES;
	open my $fd,">$output";
	print $fd $res;
	close $fd;
}


