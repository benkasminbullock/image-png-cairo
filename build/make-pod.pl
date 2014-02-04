#!/home/ben/software/install/bin/perl
use warnings;
use strict;
use Template;
use FindBin;

my $out = "$FindBin::Bin/../lib/Image/PNG/Cairo.pod";
my $in = "$out.tmpl";

my $tt = Template->new (
    ABSOLUTE => 1,
    INCLUDE_PATH => [
	"$FindBin::Bin/../examples",
    ],
    FILTERS => {
        xtidy => [
            \& xtidy,
            0,
        ],
    },
#    STRICT => 1,
);

my %vars;

$tt->process ($in, \%vars, $out, {binmode => 'utf8'}) or die '' . $tt->error ();

exit;

# This removes some obvious boilerplate from the examples, to shorten
# the documentation, and indents it to show POD that it is code.

sub xtidy
{
    my ($text) = @_;

    # Remove shebang.

    $text =~ s/^#!.*$//m;

    # Remove sobvious.

    $text =~ s/use\s+(strict|warnings);\s+//g;
    $text =~ s/^binmode\s+STDOUT.*?utf8.*?\s+$//gm;
    $text =~ s/use\s+lib.*?;\s+//g;
#    $text =~ s/use\s+Image::PNG::.*?;\s+//g;

    # Replace tabs with spaces.

    $text =~ s/ {0,7}\t/        /g;

    # Add indentation.

    $text =~ s/^(.*)/    $1/gm;

    return $text;
}
