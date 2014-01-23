=encoding UTF-8

=head1 NAME

Image::PNG::Cairo - extract PNG data from a Cairo::ImageSurface

=head1 SYNOPSIS

    use Image::PNG::Cairo 'cairo_to_png';
    use Cairo;
    my $surface = Cairo::ImageSurface->new ('argb32', 100, 100);
    # Draw something on surface.
    my $png = cairo_to_png ($surface);
    # Now can use the methods of Image::PNG::Libpng on the PNG,
    # e.g. write to file.

=head1 DESCRIPTION

This is a bridge between L<Cairo> and L<Image::PNG::Libpng> which
allows the user to extract the image data from a Cairo::ImageSurface
into a structure which can then be manipulated to add other kinds of
data.

=head1 FUNCTIONS

=head2 cairo_to_png

    my $png = cairo_to_png ($surface);

Only surfaces of type 'argb32' are supported.

=head1 LICENCE, COPYRIGHT, AUTHOR

Copyright Ben Bullock <bkb@cpan.org> 2014; this module may be used,
redistributed, and modified under the same terms as Perl itself.

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
our $VERSION = '0.03';
require XSLoader;
XSLoader::load ('Image::PNG::Cairo', $VERSION);
use Cairo;
use Image::PNG::Libpng qw/create_write_struct get_internals/;
use Image::PNG::Const qw/PNG_TRANSFORM_BGR/;

sub cairo_to_png
{
    my ($surface) = @_;
    if (ref $surface ne 'Cairo::ImageSurface') {
	croak "Bad input " . ref $surface;
    }
    my $png = create_write_struct ();
    my ($pngs, $info) = get_internals ($png);
    my $row_pointers = fill_png_from_cairo_surface ($surface, $pngs, $info);
    # Set up the transforms of data.
    $png->set_transforms (PNG_TRANSFORM_BGR);
    $png->copy_row_pointers ($row_pointers);
    free_row_pointers ($row_pointers);
    return $png;
}

1;
