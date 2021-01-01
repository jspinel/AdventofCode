#! /bin/usr/perl 

use strict;
use warnings;

use Data::Dumper;

my @ticket = (103,79,61,97,109,67,89,83,59,53,139,131,101,113,149,127,71,73,107,137);
my %params;


open(my $fh, '<', 'input.txt') or die $!;
my $tix = 0;
my $sum = 0;
my @validTicks;
while (my $line = <$fh>){
    chomp $line;
    next if $line eq "";  #Skip empty lines
    $tix++ if $line =~ /tickets/; #Exit condition parameter collection
    next if $line =~ /tickets/;   #Don't process the row deciding where the tickets are
    if ($tix == 0){
        # Data collections
        my ($param, $vals) = split(/:/, $line);
        my ($v1, $v2) = split(/ or /, $vals);
        my @vals;
        push @vals, split(/-/,$v1);
        push @vals, split(/-/,$v2);
        $params{$param} = \@vals;
    }
    else{
        my @vals = split(/,/, $line);
        # From analysing data, all points are valid so long as they are
        #between 25 & 974 inclusive
        my $valid = 1;
        foreach my $val (@vals){
            if (($val < 25) or ($val > 974))
            {
                $sum += $val;
                $valid = 0;
                last;
            }
        }
        
        push(@validTicks, $line) if ($valid == 1);
        
    }
    
}
close $fh;

#   DEBUGGING
#   print Dumper %params;  

#Part 1
print("SUM: $sum");
