#! /usr/bin perl

use strict;
use warnings;

my $fh;

open($fh, '<', "data1.txt") or die $!;

my $count = 0;
my $part2 = 0;

while (my $line = <$fh>){
	chomp($line);
	$line =~ s/-/,/;
	$line =~ s/\s/,/g;
	$line =~ s/://;
	my @data = split(/,/, $line);
	
	my $min = $data[0];
	my $max = $data[1];	
	my $check = $data[2];
	my $d = $data[3];
	
	#Part 1
	$d =~ s/[^$check]//g;
	$count++ if (length($d) <= $max) && (length($d) >= $min);
	
	#Part 2
	my @pw = split(//,$data[3]);
	$min--;
	$max--;
	$part2++ if (($pw[$min] eq $check) xor ($pw[$max] eq $check));
	
}
close($fh);

print("Part1: ", $count, "\n");
print("Part2: ", $part2);
