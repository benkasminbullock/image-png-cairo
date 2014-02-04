#!/home/ben/software/install/bin/perl
use warnings;
use strict;
use FindBin;
use Perl::Build;
perl_build (
    make_pod => "$FindBin::Bin/build/make-pod.pl",
);
exit;
