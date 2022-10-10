use warnings;
use strict;
use utf8;
use FindBin '$Bin';
use Test::More;
my $builder = Test::More->builder;
binmode $builder->output,         ":utf8";
binmode $builder->failure_output, ":utf8";
binmode $builder->todo_output,    ":utf8";
binmode STDOUT, ":encoding(utf8)";
binmode STDERR, ":encoding(utf8)";
use Image::PNG::Libpng 'access_version_number';
my $avn = access_version_number ();
ok ($avn =~ m!^[0-9]+$!, "Got access_version_number");
done_testing ();
