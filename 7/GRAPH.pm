#! /usr/bin/env perl

use strict;
use warnings;

use Data::Dumper qw (Dumper);

package Node;
###############
# Node        #
# -> name     #
# -> children #
#    -> name  #
###############
sub new{
	my ($class, $name, $kids, $parents) = @_;
	
	my $self ={
		name => $name,
		children => $kids,
		parents => $parents,	
	};
	
	bless $self, $class;
	return $self;
}


1;



package Graph;

sub new{
	
}

sub addNode{
}

1;
