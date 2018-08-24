use Text::CSV::Slurp;
# use strict;
# use warnings;

 #https://metacpan.org/pod/Text::CSV::Slurp


# my $slurp = Text::CSV::Slurp->new();

# load data from CSV input
 
$filename = "test.csv"; 
my $data = Text::CSV::Slurp->load(file       => $filename );

# print Dumper($data);

foreach $instance (@$data) {
    print $instance->{Name}, "\n";
}

# $, = "\n";
# print keys $data->[0];
# print $data->[0]{desc};
# my $data = Text::CSV::Slurp->load(filehandle => $filehandle [,%options]);
# my $data = Text::CSV::Slurp->load(string     => $string     [,%options]);
 
# create a string of CSV from an array of hashes
# my $csv  = Text::CSV::Slurp->create( input => \@array_of_hashes);