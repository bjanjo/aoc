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
my $coords = "";
foreach (@commands) {
    print "\n\n\n\n";
    my $dx = $x_cur - $x_prev;
    my $dy = $y_cur - $y_prev;
    my $cmd = $_;
    $cmd =~ s/\D//g;
    my $step = $cmd;
    print "$_, x_cur=$x_cur, y_cur=$y_cur, x_prev=$x_prev, y_prev=$y_prev, dx=$dx, dy=$dy, step=$step\n" if $debug;
    $x_prev = $x_cur;
    $y_prev = $y_cur;
    if ( $dx != 0 ) {
         $y_cur = $y_cur + $step*($dx/abs($dx)) if index($_, 'R') == -1;
         $y_cur = $y_cur - $step*($dx/abs($dx)) if index($_, 'L') == -1; 
         print "Coords between ($x_prev,$y_prev) and ($x_cur,$y_cur): " if $debug;
         my @range;
         if ($y_prev < $y_cur) {
             @range = ($y_prev..($y_cur-1));
         } else {
             @range = ((1+$y_cur)..$y_prev);
         }

         foreach my $y_coord (@range) {
                my $coord_string = as_coord_string($x_cur, $y_coord);
                print " ".$coord_string if $debug;
                if ($coords =~ /$coord_string/) {
                    print "\nFound first coord visited twice: " . $coord_string . "\n";
                    my $distance = abs($x_cur) + abs($y_coord);
                    print "Taxicab distance=$distance\n";
                    exit;
                }
                $coords .= " " . $coord_string;
         }
         print "\n" if $debug;
    } elsif ( $dy != 0 ) {
        $x_cur = $x_cur + $step*($dy/abs($dy)) if index($_, 'L') == -1;
        $x_cur = $x_cur - $step*($dy/abs($dy)) if index($_, 'R') == -1;
        print "Coords between ($x_prev,$y_prev) and ($x_cur,$y_cur): " if $debug;
        my @range;
        if ($x_prev < $x_cur) {
            @range = ($x_prev..($x_cur-1));
        } else{
            @range = ((1+$x_cur)..$x_prev);
        }
        foreach my $x_coord (@range) {
                my $coord_string = as_coord_string($x_coord, $y_prev);
                print " ".$coord_string if $debug;
                if ($coords =~ /$coord_string/) {
                    print "\nFound first coord visited twice: " . $coord_string . "\n";
                    my $distance = abs($x_coord) + abs($y_cur);
                    print "Taxicab distance=$distance\n";
                    exit;
                }
                $coords .= " " . $coord_string;
         }
         print "\n" if $debug;
    } else {
        print "Bad coordinate: x_cur=$x_cur, y_cur=$y_cur, dx=$dx, dy=$dy \n";
    }
    print $coords."\n";
}
print "Coords=$coords\n";
print "Xcur=$x_cur\n";
print "Ycur=$y_cur\n";
my $distance = abs($x_cur) + abs($y_cur);
print "Taxicab distance=$distance\n";
sub as_coord_string{
    my ($x_cur)=@_;
    shift;
    my ($y_cur)=@_;
    return "_".$x_cur . "_" . $y_cur."_";
}
