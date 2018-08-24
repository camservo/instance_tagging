#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV::Slurp;

# Should pass the file as argument.
my $file = "test.csv";
my $data = &parse_csv($file);

foreach my $instance (@$data) {
    tag_instance($instance)
}

sub parse_csv {
    my $file = shift;
    my $data = Text::CSV::Slurp->load(file => $file );
    
    return($data)
}

sub tag_instance {
    my $instance = shift;

    my $name = $instance->{Name};
    my $desc = $instance->{desc};
    print "name: $name\n";
    print "desc: $desc\n";

    ##TODO: parse tag for existing values.

    ##TODO: create new tag that keeps existing values and writes new ones.
}