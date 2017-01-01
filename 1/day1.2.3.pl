#!/usr/bin/perl
use strict;
use warnings;

use autodie; # die if problem reading or writing a file
use Data::Dumper qw(Dumper);
my $debug = 1; 
chomp(my $line = <STDIN>);
my @commands = split /\s*,\W*/, $line;

my $x_prev = 0;
my $y_prev = -1;
my $x_cur = 0;
my $y_cur = 0;

foreach (@commands) {
    my $dx = $x_cur - $x_prev;
    my $dy = $y_cur - $y_prev;
    my $cmd = $_;
    $cmd =~ s/\D//g;
    my $step = $cmd;
    print "$_, x_cur=$x_cur, y_cur=$y_cur, x_prev=$x_prev, y_prev=$y_prev, dx=$dx, dy=$dy, step=$step\n" if $debug;
    $x_prev = $x_cur;
    $y_prev = $y_cur;
    if ( $dx != 0 ) {
        if (index($_, 'R') == -1) {
            $y_cur = $y_cur + $step*($dx/abs($dx));
        $y_cur = $y_cur - $step*($dx/abs($dx)) if index($_, 'L') == -1;

    } elsif ( $dy != 0 ) {
        $x_cur = $x_cur + $step*($dy/abs($dy)) if index($_, 'L') == -1;
        $x_cur = $x_cur - $step*($dy/abs($dy)) if index($_, 'R') == -1;
    } else {
        print "Bad coordinate: x_cur=$x_cur, y_cur=$y_cur, dx=$dx, dy=$dy \n";
    }
}

print "Xcur=$x_cur\n";
print "Ycur=$y_cur\n";
my $distance = abs($x_cur) + abs($y_cur);
print "Taxicab distance=$distance\n";

