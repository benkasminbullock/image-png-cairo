use strict;
use warnings;
use ExtUtils::MakeMaker;

my $pm = 'lib/Image/PNG/Cairo.pm';
my $github = 'github.com/benkasminbullock/Image-PNG-Cairo';
my $repo = "https://$github";

WriteMakefile (
    NAME => 'Image::PNG::Cairo',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    LICENSE => 'perl',
    PREREQ_PM => {
    },
    META_MERGE => {
	'meta-spec' => {
	    version => 2,
	},
        resources => {
            repository => {
		type => 'git',
		url => "git://$github.git",
		web => $repo,
	    },
            bugtracker => {
		web => "$repo/issues",
	    },
#	    homepage => 'http://',
        },
    },
    OBJECT => 'Cairo.o',
);
