#! /usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

my %bags;

open(my $fh, '<', "input.txt") or die $!;


while (my $line = <$fh>){
	chomp $line;
	$line =~ s/^([a-z]+\s[a-z]+)\sbags contain//;
	my $holder = $1;
	if ($line =~ /no other/){
		$bags{$holder} = ();
	}
	else{
		my %tmp;
		while ($line =~ s/(\d)\s([a-z]+\s[a-z]+)\sbag//){
			$tmp{$2} = $1;
		}
		$bags{$holder} = \%tmp;
	}
	
}


print (part1(\%bags, \%bags));

sub part1{
	my $bags = shift;
	my $testBags = shift;
	my %test  = %$testBags;
	my %stuff = %$bags;
	my $count = 0;
	foreach (keys %test){		
		print ($_, "\n");
		if ($_ eq "'shiny gold'"){
			return 1;
		}
		elsif (%$bags{$_} == {}){
			return 0;
		}
		else{
			my %ht = %stuff{$_};
			print Dumper %ht;
			print $count, "\n";
			$count += part1($bags, \%ht);
		}
	}	
	return $count;;
}


