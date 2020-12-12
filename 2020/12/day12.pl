#! /usr/bin/env perl

use strict;
use warnings;

my @pos = (0,0);
my $bearing = 90;

open (my $fh, '<', 'input.txt');

while (my $line = <$fh>){
	chomp $line;
	
	$bearing = $bearing % 360;  #add / substract 
	
	$line =~ /([A-Z])(\d+)/;
	my ($action, $value) = ($1, $2);
	
	if ($action eq "F")
	{
		$action = "N" if $bearing == 0;
		$action = "E" if $bearing == 90;
		$action = "S" if $bearing == 180;
		$action = "W" if $bearing == 270;
		
	}
	
	#NSEW
	$pos[1] += $value if ($action eq "N");
	$pos[1] -= $value if ($action eq "S");
	$pos[0] += $value if ($action eq "E");
	$pos[0] -= $value if ($action eq "W");
	
	$bearing += $value if ($action eq "R");
	$bearing -= $value if ($action eq "L");
	
	

}

print("Part 1: ", abs($pos[0]) + abs($pos[1]), "\n");
print ($pos[0], " ", $pos[1]);
