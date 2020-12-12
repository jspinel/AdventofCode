#! /usr/bin/env perl

use strict;
use warnings;

my $fh;

open($fh,'<','input.txt') or die $!;
#open($fh, '<', 'sample.txt') or die $!;

my %record;
my $count = 0;
my $count2 = 0;
while(my $line = <$fh>){
	chomp($line);
	 unless ($line eq ""){ 
		my @kv = split(/ /, $line);
		foreach (@kv){
			my @pair = split(/:/, $_);
			$record{$pair[0]} = $pair[1];
		
		}
	
	}
	elsif  ($line eq ""){
	if (checkRecord(\%record)){
		$count++;
	}
	%record = ();
	$count2++;
	}

}

print($count, " ", $count2, "\n");

sub checkRecord{
	my $href = $_[0];
	my %rec = %$href;
	my @recKeys = keys %rec;
	
	my @testKeys = ("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid");  #Accept no CID
	
	foreach (@testKeys){
		unless (exists $rec{$_}){
			return 0;
		}
	}
	
	return 0 if (($rec{"byr"} < 1920) or ($rec{"byr"} > 2002));  #byr
	return 0 if (($rec{"iyr"} < 2010) or ($rec{"iyr"} > 2020));  #iyr
	return 0 if (($rec{"eyr"} < 2020) or ($rec{"eyr"} > 2030));  #iyr
	return 0 unless ($rec{"pid"} =~ /^[0-9]{9}$/);               #pid
	return 0 unless ($rec{"ecl"} =~ /^amb$|^blu$|^brn$|^gry$|^grn$|^hzl$|^oth$/);
	return 0 unless ($rec{"hcl"} =~ /^\#[abcdef0123456789]{6}$/);
	
	return 0 unless ($rec{"hgt"} =~ /^\d+cm|in$/);                #hgt
	if ($rec{"hgt"} =~ /(\d+)cm/){
		return 0 if (($1 < 150) or ($1 > 193));
	}
	elsif ($rec{"hgt"} =~ /(\d+)in/){
		return 0 if (($1 < 59) or ($1 > 76));
	}
	
	return 1;
}

