=encoding UTF-8

=head1 NAME

Image::PNG::Cairo - abstract here.

=head1 SYNOPSIS

    use Image::PNG::Cairo;

=head1 DESCRIPTION

=head1 FUNCTIONS

=cut
package Image::PNG::Cairo;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw/cairo_to_png/;
%EXPORT_TAGS = (
    all => \@EXPORT_OK,
);
use warnings;
use strict;
use Carp;
our $VERSION = 0.01;
require XSLoader;
XSLoader::load ('Image::PNG::Cairo', $VERSION);
use Cairo;
use Image::PNG::Libpng qw/create_write_struct get_internals/;
use Devel::Peek;

sub cairo_to_png
{
    my ($surface) = @_;
    if (ref $surface ne 'Cairo::ImageSurface') {
	croak "Bad input " . ref $surface;
    }
    my $png = create_write_struct ();
    my ($pngs, $info) = get_internals ($png);
#    Dump ($pngs);
#    Dump ($info);
#    print "--- $surface, $pngs, $info\n";
    fill_png_from_cairo_surface ($surface, $pngs, $info);

    return $png;
}

1;
