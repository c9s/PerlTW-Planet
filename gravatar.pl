#!/usr/bin/env perl
use warnings;
use strict;
use LWP::Simple qw(getstore);
use File::Path qw(mkpath);
use File::Spec;
use Digest::MD5 qw(md5_hex);
my %users = qw( 
    audreyt audreyt@audreyt.org
    clkao clkao@clkao.org
    c9s cornelius.howl@gmail.com
    gugod gugod@gugod.org
    gslin gslin@gslin.org
    clsung clsung@gmail.com
);

my $outdir = 'output/faces';
mkpath [ $outdir ];
map { 
    warn $_->[0];
    getstore("http://www.gravatar.com/avatar/" . $_->[1] , File::Spec->join($outdir , $_->[0] . ".png") )
    } map { [ $_ , md5_hex($users{$_}) ] } keys %users;
