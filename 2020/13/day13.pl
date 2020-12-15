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

}


print ("Part 1: ", $id*$time, "\n");


## PART 2
my %busNum;

for (my $index = 0; $index <= $#buses2; $index++){
    unless ($buses2[$index] eq "x"){
        $busNum{$index} = $buses2[$index];
    }
    
}

$time = 0;
my $period = 1;

$departure = 0;

foreach (sort{$a<=>$b} keys %busNum){
    print("Index, $_\n");
    $departure = 0;
    while ($departure == 0){
        if (($time +$_) % $busNum{$_} == 0){
            print("Hit level $_ at time $time\n");
            $departure++
        }
        else{
            $time += $period;
        }
    }
    $period *= $busNum{$_};

}

  
    
    
