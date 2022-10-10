use warnings;
use strict;
use Test::More;
use Image::PNG::Libpng ':all';
use FindBin '$Bin';

BEGIN: {
    use lib "$Bin";
    use IPNGLT;
};

my @tests = (
{
    file => 'ch1n3p04',
    nhist => 15,
},
{
    file => 'ch2n3p08',
    nhist => 256,
},
);

for my $test (@tests) {
    my $file = "$Bin/libpng/$test->{file}.png";
    my $png = read_png_file ($file);
    my $valid = get_valid ($png);
    ok ($valid->{hIST}, "Valid hist in $test->{file}");
    my $hist = $png->get_hIST ();
    is (@$hist, $test->{nhist}, "Right histogram size in $test->{file}");
    my $wpng = copy_png ($png);
    my $rpng = round_trip ($wpng, "$Bin/hist.png");
    is_deeply ($rpng->get_hIST (), $hist, "Round trip of hIST chunk");
}

done_testing ();
exit;
