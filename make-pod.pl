#!/home/ben/software/install/bin/perl
use warnings;
use strict;
use Template;
use FindBin '$Bin';
use Perl::Build::Pod ':all';
use Perl::Build qw/get_info get_commit/;
my $exdir = "$Bin/examples";
make_examples ($exdir, undef, undef);

my $tt = Template->new (
    ABSOLUTE => 1,
    INCLUDE_PATH => [
	$exdir,
	"/home/ben/projects/Perl-Build/lib/Perl/Build/templates",
    ],
    FILTERS => {
        xtidy => [
            \& xtidy,
            0,
        ],
    },
    STRICT => 1,
);

my %vars;

my $info = get_info ();
$vars{info} = $info;
$vars{commit} = get_commit ();
my $pod = $info->{pod};
chmod 0644, $pod;
$tt->process ("$Bin/$pod.tmpl", \%vars, "$Bin/$pod") or die '' . $tt->error ();
chmod 0444, $pod;
exit;
