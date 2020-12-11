#! /usr/bin/env perl

use strict;
use warnings;




my  @adapters;

open (my $fh, '<', 'input.txt');

while (my $line = <$fh>){
	chomp $line;
	push @adapters, $line;
}
close ($fh);
@adapters = sort {$a<=>$b} @adapters;
unshift @adapters, 0;


my $count1 = 0;
my $count3 = 1;
my $current = 0;
#Part 1
foreach (@adapters){
	if ($current + 1 == $_){
		$count1++;
	}
	elsif ($current + 3 == $_){
		$count3++;
	}
	$current = $_;
	
}

print ("Part1: ", $count1*$count3, "\n");


########################################################################
###                            PART 2                                ###
########################################################################

push @adapters, $current; 

print("\nPart2\n");

my %routes; 
foreach my $jolt (@adapters){
	$routes{$jolt} = 0;
}
$routes{0} = 1;  # The first plug is there



for (my $i = 0; $i < $#adapters; $i++){
	my $jolt = $adapters[$i];
	my $r = $routes{$jolt};
	for (1..3){
		my $inc = $_;
		if ( defined ( $routes{$jolt+$inc})){
			# If the joltage exists, add the possible routes to that one
			$routes{$jolt+$inc} += $r;
		}
	}
}

print ($routes{$current}, "\n");
