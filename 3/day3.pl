#! /usr/bin perl

use strict;
use warnings;

use Data::Dumper;

my $fh;

open($fh,'<','input.txt') or die $!;

my $y = 0;
my $x1 = 0;
my $x2 = 0;
my $x3 = 0;
my $x4 = 0;
my $x5 = 0;
my $realX = 0;
my $trees1 = 0;
my $trees2 = 0;
my $trees3 = 0;
my $trees4 = 0;
my $trees5 = 0;

while (my $line = <$fh>){
	chomp($line);
	my @row = split(//, $line);
	$trees1++ if $row[$x1] eq "#";
	$trees2++ if $row[$x2] eq "#";
	$trees3++ if $row[$x3] eq "#";
	$trees4++ if $row[$x4] eq "#";
	if ($y % 2 == 0){
		$trees5++ if $row[$x5] eq "#";
		$x5 = ($x5++) % 31;
	}
	$y++;
	$x1 = ($x1 + 1) % 31;
	$x2 = ($x2 + 3) % 31;
	$x3 = ($x3 + 5) % 31;
	$x4 = ($x4 + 7) % 31;
	
	
	

}

print($trees1, "\n");
print($trees2, "\n");
print($trees3, "\n");
print($trees4, "\n");
print($trees5, "\n");
# slope 1 right, 1 down:  70
# Slope 3 right, 1 down: 240
# Slope 5 right, 1 down:  68
# Slope 7 right, 1 down:  67
# Slope 1 right, 2 down:  39

my $prod = $trees1*$trees2*$trees3*$trees4*$trees5;
print ($prod);





