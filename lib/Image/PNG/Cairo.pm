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
@EXPORT_OK = qw//;
%EXPORT_TAGS = (
    all => \@EXPORT_OK,
);
use warnings;
use strict;
use Carp;
our $VERSION = 0.01;
require XSLoader;
XSLoader::load ('Image::PNG::Cairo', $VERSION);
1;
