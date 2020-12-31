#! /usr/bin/env perl

use strict;
use warnings;


my @mask;
my %mem;

open(my $fh, '<', 'input.txt');

while (my $line = <$fh>){
    chomp $line;
    
    if ($line =~ /mask/) {
        # Rebuild mask with 36 chars
        # Regex extracts the mask and is mapped to $1
        # Split returns an array of each individual char
        # => can then be applied on a char by char basis.
        $line =~ /([01X]{36})/;
        @mask = split(//, $1);
    }
    else{
        # Extract thekey and value pairs 
        $line =~ s/(\d+)//;
        my $key = $1;
        $line =~ s/(\d+)//;
        my $val = $1;
        # Convert val to binary representation
        my $bin = sprintf("%b", $val);
        # Place Val in an array so we can do char by char comparison
        my @val = split(//, $bin);
        # Make @val the same size as @mask
        while ($#val < 35){
            unshift(@val, 0);
        }
               
        foreach (0..35){           
            next if $mask[$_] eq "X";
            $val[$_] = $mask[$_];
        }
        
        $val = join('', @val);
        $val = oct("0b".$val);
        $mem{$key} = $val;
    }    
}

close($fh);

my $sum = 0;
foreach (keys %mem){
    $sum += $mem{$_};
}

print("SUM: $sum\n");


