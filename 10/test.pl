#!/usr/bin/perl

use strict;
use warnings;

#use List::AllUtils  qw(max);

no warnings 'recursion';

my @memo  = (1);
open (my $fh, '<', 'input.txt');
my @adapt = (0, sort { $a <=> $b } <$fh>);
close($fh);

print $adapt[-1];

sub recurse_adapt {
    my $idx = shift;

    return ($memo[ $idx ])  if (defined $memo[ $idx ]);

    my $ret = 0;
    my $min = max( $adapt[$idx] - 3, 0 );

    my $i = $idx;
    while( --$i >= 0 && $adapt[$i] >= $min ) {
        $ret += &recurse_adapt( $i );
    }

    @memo[$idx] = $ret;
    return( $ret );
}

my $part2 = recurse_adapt($#adapt);
print "Part 2: ", $part2, "\n";

sub max{
	my $a = shift;
	my $b = shift;
	return $a if ($a > $b);
	return $b;
}
