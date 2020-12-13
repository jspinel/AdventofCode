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
my @buses = sort split(/,/, $departures);

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
$departures =~ s/x,//g;
@buses = split(/,/, $departures);

$departure = 0;
$timestamp =100000000000000;
$time = $timestamp;
my $step = 1;
while ($departure == 0){
    $timestamp = $time;
    if ($time % $buses[0] == 0){
        $step = $buses[0];
        if(++$time % $buses[1] == 0){            
            $step = $buses[0]*$buses[1];
            if(++$time % $buses[2] == 0){
                $step = $buses[0]*$buses[1]*$buses[2];
                if (++$time % $buses[3] == 0){
                    $step = $buses[0]*$buses[1]*$buses[2]*$buses[3];
                    if (++$time % $buses[4] == 0){
                        $step = $buses[0]*$buses[1]*$buses[2]*$buses[3]*$buses[4];
                        $departure = 1;
                    }
                }
            }
        }
    }
    if ($departure == 1){
        $departure = 0;
        if(++$time % $buses[5]== 0){
            if(++$time % $buses[6] == 0){
                if(++$time % $buses[7] == 0){
                    print("Hit Level 8 yo!\n");
                    print("At time: ", $time, "\n");
                    $departure = 1;
                }
            }
        }        
    }
    $time = $timestamp + $step;
}
