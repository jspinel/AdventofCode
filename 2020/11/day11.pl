#! /usr/bin/env perl

use strict;
use warnings;

my @waitingRoom;
my $length = 0;
my $width = undef;

open (my $fh, '<', 'input.txt');

while (my $line = <$fh>){
	chomp $line;
	
	my @row = split(//, $line);
	$waitingRoom[$length] = \@row;
	$length++;
	unless ($width){
		$width = @row;
		$width--;
	}

}

$length = $#waitingRoom;
my $changes;
my $pass = 0;
do {
	$changes = 0;
	for (my $i = 0; $i <= $length; $i++){
		print("Row: ", $i, "\n");
		for (my $j = 0; $j <= $width; $j++){
		testChange($i,$j);
			if ($waitingRoom[$i][$j] =~ /F/){
				$changes++;
			}
		#print "wazza";
		}
	}
	print("Changes: ", $changes, "\n");
	
	for (my $i = 0; $i <= $length; $i++){
		for (my $j = 0; $j <= $width; $j++){
			$waitingRoom[$i][$j] = "#"	if $waitingRoom[$i][$j] eq "FU";
			$waitingRoom[$i][$j] = "L"	if $waitingRoom[$i][$j] eq "FE";
			print($waitingRoom[$i][$j], " ");
		}
		print("\n");
	}
	print(++$pass, "\n");
	
}
while ($changes > 0);


##PART 1
my $occupied;
for (my $i = 0; $i <= $length; $i++){
	for (my $j = 0; $j <= $width; $j++){
		$occupied++ if $waitingRoom[$i][$j] eq "#";
	}
}
print ("Part1: ", $occupied, "\n");




sub testChange{
	my $row = shift;
	my $col = shift;
	
	# $row gives y axis
	# $col gives x axis
	
	# 4 states: Empty, Used, FutureEmpty, Future Used
	# Empty: L  / Future Empty: FE
	# Used:  #  / Future Used:  FU	
	
	my $state = $waitingRoom[$row][$col];
	my $counter = 0;
	
	
	if ($state eq "L"){
		#Check if the seat becomes occupied
		
		unless ($row == 0){	#Test row above
			unless ($col == 0){
				return 0 if $waitingRoom[$row-1][$col-1] eq "#";
				return 0 if $waitingRoom[$row-1][$col-1] eq "FE";
			}
			return 0 if $waitingRoom[$row-1][$col] eq "#";
			return 0 if $waitingRoom[$row-1][$col] eq "FE";
			unless ($col == $width){
				return 0 if $waitingRoom[$row-1][$col+1] eq "#";
				return 0 if $waitingRoom[$row-1][$col+1] eq "FE";
			}
		}
		
		#test same row
		unless ($col == 0){
			return 0 if $waitingRoom[$row][$col-1] eq "#";
			return 0 if $waitingRoom[$row][$col-1] eq "FE";
		}
		
		unless ($col == $width){
			return 0 if $waitingRoom[$row][$col+1] eq "#";
			return 0 if $waitingRoom[$row][$col+1] eq "FE";
		}
		
		unless ($row == $length){#Test row below
			unless ($col == 0){
				return 0 if $waitingRoom[$row+1][$col-1] eq "#";
				return 0 if $waitingRoom[$row+1][$col-1] eq "FE";
			}
			return 0 if $waitingRoom[$row+1][$col] eq "#";
			return 0 if $waitingRoom[$row+1][$col] eq "FE";
			unless ($col == $width){
				return 0 if $waitingRoom[$row+1][$col+1] eq "#";
				return 0 if $waitingRoom[$row+1][$col+1] eq "FE";
			}
		}
		
		$waitingRoom[$row][$col] = "FU";
		return 1;
	}
	
	elsif ($state eq "#")
	{	
		# Check if the seat gets freed up
		my $counter = 0;
		
		unless ($row == 0){ # Test row above
			unless ($col == 0){
				$counter++ if $waitingRoom[$row-1][$col-1] eq "#";
				$counter++ if $waitingRoom[$row-1][$col-1] eq "FE";
			}
			$counter++ if $waitingRoom[$row-1][$col] eq "#";
			$counter++ if $waitingRoom[$row-1][$col] eq "FE";
			unless ($col == $width){
				$counter++ if $waitingRoom[$row-1][$col+1] eq "#";
				$counter++ if $waitingRoom[$row-1][$col+1] eq "FE";
			}
		}
		
		#test same row
		unless ($col == 0){
			$counter++ if $waitingRoom[$row][$col-1] eq "#";
			$counter++ if $waitingRoom[$row][$col-1] eq "FE";
		}
		
		unless ($col == $width){
			$counter++ if $waitingRoom[$row][$col+1] eq "#";
			$counter++ if $waitingRoom[$row][$col+1] eq "FE";
		}
		
		unless ($row == $length){#Test row below
			unless ($col == 0){
				$counter++ if $waitingRoom[$row+1][$col-1] eq "#";
				$counter++ if $waitingRoom[$row+1][$col-1] eq "FE";
			}
			$counter++ if $waitingRoom[$row+1][$col] eq "#";
			$counter++ if $waitingRoom[$row+1][$col] eq "FE";
			unless ($col == $width){
				$counter++ if $waitingRoom[$row+1][$col+1] eq "#";
				$counter++ if $waitingRoom[$row+1][$col+1] eq "FE";
			}
		}
		
		$waitingRoom[$row][$col] = "FE" if $counter >= 4;
		return 1;
	}	
	
	return 0; #state is . or floor
}



