#!/usr/bin/perl

# use strict;
# use warnings;
use Text::CSV;
use Data::Dump;

my $file = "test.csv";

my @refData = &parse_csv($file);
my @data;

foreach my $instance (@refData) {
    # print "working: $instance->[0]";
    tag_instance($instance)
}


# print @test_array;
# dump @test_array;

# @test = @test_array[0];
# foreach my $line (@test) {
 
#     print $line->[0], $line->[1];
# }

# print @test_array[0]->{Name}, "\n";


sub parse_csv {

    my $file = shift;

    open my $fh, "<", $file or die "$file: $!";

    my $csv = Text::CSV->new ({
        binary => 1,
        auto_diag => 1
    });

    $csv->column_names ($csv->getline ($fh)); # use header

    my @array;

    while (my $row = $csv->getline_hr ($fh)) {

        # push @array, $row;
        push @array, [$row->{Name}, $row->{desc}]

        # my $name = $row->{Name};
        # my $desc = $row->{desc};

        # @array[0]=$name;
        # @array[1]=$desc;

        # printf "Name: %-32s Contact: %s\n",
        # $row->{Name}, $row->{Address};

        # push @array, [$name, $desc];
        # push @array, $desc;


        # $description = $row->{Name};
    }



    # print "description: ", $description, "\n";

    close $fh;

    # push @array_of_hashes, $row;

    return(@array)
}

sub tag_instance {
    my $instance = shift;

    my $name = $instance->[0];
    my $desc = $instance->[1];

    print "Name: ", $name, ":\n";
    print "Desc: ", $desc, ":\n";
}