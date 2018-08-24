#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

# Should pass the file as argument.
my $file = "test.csv";

# It would be nice to have this dereferenced.  I hate dealing with ref data.
my @refData = &parse_csv($file);

foreach my $instance (@refData) {
    tag_instance($instance)
}

sub parse_csv {
    my $file = shift;
    open my $fh, "<", $file or die "$file: $!";
    my $csv = Text::CSV->new ({
        binary => 1,
        auto_diag => 1
    });

    $csv->column_names ($csv->getline ($fh)); # use header to reference data.

    my @data;
    while (my $row = $csv->getline_hr ($fh)) {
        push @data, [$row->{Name}, $row->{desc}] # reference data by name in header
    }
    close $fh;

    return(@data);
}

sub tag_instance {
    my $instance = shift;

    my $name = $instance->[0];
    my $desc = $instance->[1];

    ##TODO: parse tag for existing values.

    ##TODO: create new tag that keeps existing values and writes new ones.

    # print "Name: ", $name, ":\n";
    # print "Desc: ", $desc, ":\n";
}