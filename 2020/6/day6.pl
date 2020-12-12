use strict;
use warnings;
use Data::Dumper;

my $fh;
my %group;
my @alphabet = ("a".."z");
my $answers = 0;
my $part2 = 0;
my $groupSize = 0;
open($fh,'<','input.txt') or die $!;

while (my $line = <$fh>){
	chomp $line;
	if ($line eq ""){
		# Part 1
		my $size = keys %group;
		$answers += $size;
		
		# Part 2
		foreach (keys %group){
			$part2++ if $group{$_} == $groupSize;
		}
		
		$groupSize = 0;
		%group = ();
	}
	else
	{
		$groupSize++;
		foreach (@alphabet){
			$group{$_}++ if ($line =~ /$_/);
			
		}
	}
}





print("Part 1: ", $answers, "\n");
print("Part 2: ", $part2,); 
