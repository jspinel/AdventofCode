#! /usr/bin/env perl

use strict;
use warnings;

my @instructions;
# %instruction  = { 'id'     = {
# 								'action' = action,
#                   			'value'  = signed value,
#                   			'exec'   = 0}}

my $acc;
my $id = 0;

open(my $fh, '<', "input.txt") or die $!;


# Process input data
while (my $line = <$fh>){
	$id++;
	chomp $line;

	$line =~ s/^([a-z]{3})\s([-+][0-9]+)//;
	my $act = $1;
	my $val = 0 + $2;
	
	my @action = ($act, $val, 0);
		
	$instructions[$id] = \@action;

}

print part1(@instructions);
part2(@instructions);

sub part1{
	my @instructions = @_;
	$acc = 0;
	my $max = $id;
	$id = 1;
	while ($id <= $max){
		
		#print ("Doing instructions on line: ", $id, "\n");
		if ($instructions[$id][2] == 1){
			$instructions[$id][2]++;
			if (testArray(@instructions)){
				print("SUCCESS!", $acc, "\n");
			}
			return $acc;
			
		}
		elsif ($instructions[$id][0] eq 'acc'){
			$acc += $instructions[$id][1];
			$instructions[$id][2]++;
			$id++;
		}
		elsif ($instructions[$id][0] eq 'jmp'){
			$instructions[$id][2]++;
			$id += $instructions[$id][1];
		}
		else{
			$instructions[$id][2]++;
			$id++;		
		}
	}
	return $acc;
}

sub part2{
	my @instructionsbase = @_;
	my @instructions = @instructionsbase;
	my $max = @instructions;
	for (1..$max){
		print("Test number: ", $_, "\n");
		@instructions = @instructionsbase;
		if ($instructions[$_][0] eq 'jmp'){
			print("Testing change on row: ", $_, "\n");
			$instructions[$_][0] = 'nop';
			part1(@instructions);		
		}
		elsif ($instructions[$_][0] eq 'nop'){
			print("Testing change on row: ", $_, "\n");
			$instructions[$_][0] = 'jmp';
			part1(@instructions);
		}
	}
}

sub testArray{
	my @instructions = @_;
	my $max = @instructions;
	for (1..$max){
			return 0 if ($instructions[$_][2] > 1);
	}
	return 1;
}
