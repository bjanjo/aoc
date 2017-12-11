#!/usr/bin/perl
use strict;
use warnings;

use autodie; # die if problem reading or writing a file
use Data::Dumper qw(Dumper);
my $debug = 1; 
chomp(my $line = <STDIN>);
my @commands = split /\n/, $line;
foreach (@commands) {
    print "J\n"
}
