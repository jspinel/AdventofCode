use strict;
use warnings;
use Data::Dumper;

my $fh;

open($fh,'<','input.txt') or die $!;
#open($fh, '<', 'sample.txt') or die $!;

my $max = 0;


# Part 1

# Part 2
my %seats;


while(my $line = <$fh>){
	chomp $line;
	my $sanity = sanityCheck($line);
	$max = $sanity if $sanity > $max;
	
	# Part 2
	$seats{$sanity} = 1;	
}

print($max, "\n");
#print Dumper %seats;


foreach (0..801){
	unless (exists $seats{$_}){
		print($_, "\n");
	}
} 
if (exists $seats{596} and exists $seats{598}){
	print(597, "\n");
}




# SUBS
sub getRow{
	my $seat = shift @_;
	$seat =~ /^([FB]{7})/;
	my $row = $1;
	$row =~ s/F/0/g;
	$row =~ s/B/1/g;
	$row = oct("0b".$row);
	return $row;
}

sub getCol{
	my $seat = shift @_;
	$seat =~ /([RL]{3})/;
	my $col = $1;
	$col =~ s/R/1/g;
	$col =~ s/L/0/g;
	$col = oct("0b".$col);
	return $col;
}

sub sanityCheck{
	my $seat = shift @_;
	my $row = getRow($seat);
	my $col = getCol($seat);
	my $sanity = ($row*8)+$col;
	return $sanity;
	
}
