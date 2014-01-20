# This is a test for module Image::PNG::Cairo.

use warnings;
use strict;
use Test::More;
use Cairo;
use Image::PNG::Libpng;
use Image::PNG::Cairo 'cairo_to_png';
#use Devel::Peek;

my $surface = Cairo::ImageSurface->create ('argb32', 100, 100);
my $cr = Cairo::Context->create ($surface);
$cr->rectangle (0, 0, 100, 100);
$cr->fill ();
#Dump ($surface);
my $png = cairo_to_png ($surface);

ok ($png, "Got PNG");

done_testing ();

# Local variables:
# mode: perl
# End:
