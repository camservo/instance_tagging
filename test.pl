use strict;
use warnings;
use Text::CSV;
use Data::Dump qw(dump);
use Array::Transpose;

my @data;   # 2D array for CSV data
my $file = 'test.csv';

my $csv = Text::CSV->new;
open my $fh, '<', $file or die "Could not open $file: $!";

while( my $row = $csv->getline( $fh ) ) { 
    shift @$row;        # throw away first value
    push @data, $row;
}
@data=transpose(\@data);
dump(@data);

open $fh, ">:encoding(utf8)", "new.csv" or die "new.csv: $!";
for (@data) {
    $csv->print($fh, $_);
    print $fh "\n";
}
close $fh or die "new.csv: $!";