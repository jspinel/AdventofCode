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
        print("KEY: $key\n");
        print("This is   mask @mask\n");
        my $bin = sprintf("%b", $val);
        print("Binary: $bin\n");
        
        #~ # Place Val in an array so we can do char by char comparison
        my @val = split(//, $bin);
        
        print("Before resizing @val\n");
        #~ # Make @val the same size as @mask
        while ($#val < 35){
            unshift(@val, 0);
        }
        print("After Resizing @val\n");
        
        for (my $i = 0; $i == 35; $i++){
            next if($mask[$i] eq "X");
            $val[$i] = $mask[$i];
        }
        print("after     mask @val\n");
        $val = join('', @val);
        $val = oct($val);
        print("$val\n");
        $mem{$key} = $val;
    }    
}

close($fh);

my $sum = 0;
foreach (keys %mem){
    $sum += $mem{$_};
    print("Key: $_, Val: $mem{$_}\n");
}

