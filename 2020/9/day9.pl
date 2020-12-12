#! /usr/bin/env perl

use strict;
use warnings;




my @nums;
my @nums2;
my $counter=1;
my $part1 = 1;
open (my $fh, '<', "input.txt");
while (my $line = <$fh>){
	chomp $line;
	my $valid = 0;
	# Push all numbers into nums 2
	push @nums2, $line;
	
	# Read 25 lines into array
	if ($counter <= 25){
		push @nums, $line;
		my $size = @nums;
		
		$counter++;
	}

	else{
		my ($i, $j);
		for ($i = 0; $i < 25; $i++){
			for ($j = $i; $j < 25; $j++){
				if( $nums[$i]+$nums[$j] == $line){
					shift @nums;
					push @nums, $line;
					$valid = 1;
				}
				last if $valid == 1;
			}
			last if $valid == 1;
		}
	# part 1	
	if (($valid == 0) and ($part1 == 1)){
		print ($line, "\n");
		$part1 = $line;
		}
	}
	
}

#part2
my $maxj = @nums2;
$maxj--;
my $maxi = $maxj-1;
for (my $i = 0; $i < $maxi; $i++){
	next if $nums2[$i] >= $part1;
	my @inc;
	push @inc, $nums2[$i];
	my $sum = $nums2[$i];
	my $j = $i + 1;
	while($sum < $part1){
		$sum += $nums2[$j];
		push @inc, $nums2[$j];
		$j++;
	}
	my $max = 0;
	my $min = $part1;
	if ($sum == $part1){
		print("Part 2\n");
		print ("Sum is at: ", $sum, "\n");
		
		foreach (@inc){
			$max = $_ if $_ > $max;
			$min = $_ if $_ < $min;
		}
		print ($min, " ", $max, "\n");
		print ($min + $max);

	}
}


