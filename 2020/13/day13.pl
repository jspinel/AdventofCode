#! /usr/bin/env perl

use strict;
use warnings;

my @input;

# Read the input
open (my $fh, '<', 'input.txt');
while (my $line = <$fh>){
    chomp $line;
    push @input, $line;
}
close $fh;

# Get the input into variables 
my ($timestamp, $departures) = @input;
my @buses = split(/,/, $departures);
my @buses2 = @buses;
@buses = sort @buses;
while ($buses[-1] eq "x"){
    pop @buses;
}

my $departure = 0;
my $time = $timestamp;
my $id;

while ($departure == 0){
    foreach (@buses){
        if ($time % $_ == 0){
           $id = $_;
           $time = $time - $timestamp;
           
           $departure++;
           last; 
        }
    }
    $time++ if $departure == 0;
    print ("Timestamp: ", $time, "\n") if ($time % $timestamp == 0);
}


print ("Part 1: ", $id*$time, "\n");


## PART 2
my %busNum;

for (my $index = 0; $index < $#buses2; $index++){
    unless ($buses2[$index] eq "x"){
        print("Index: $index\n");
    }
    
}


$departure = 0;
$timestamp =100000000000000;
$time = $timestamp;
my $step = 1;

foreach (sort keys %busNum){
    print("$_\n");


}


