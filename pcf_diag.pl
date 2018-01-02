#!/usr/bin/perl
use strict;
use warnings;

binmode STDOUT, ":utf8";
use utf8;

use JSON;

my $filename = 'pcf_diag.json';

my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $filename)
      or die("Can't open \$filename\": $!\n");
   local $/;
   <$json_fh>
};

my $json = JSON->new;
my $data = $json->decode($json_text);

for ( @{$data->{added_products}->{deployed}} ) {
   print $_->{name}." ".$_->{version}."\n";
   #print $_->{stemcell}."\n";
   my $stemcell = $_->{stemcell};
   #$stemcell =~ /\"(cell)/;
   $stemcell =~ /.*stemcell-(3.*\.\d+)/;
   print "$1\n";
}
