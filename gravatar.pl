#!/usr/bin/env perl
use LWP::Simple qw(getstore);
use Digest::MD5 qw(md5_hex);
%users = qw( 
    audreyt audreyt@audreyt.org
    clkao clkao@clkao.org
    c9s cornelius.howl@gmail.com
    gugod gugod@gugod.org
);

map { 
    warn $_->[0];
    getstore("http://www.gravatar.com/avatar/" . $_->[1] , 'output/images/' . $_->[0] . ".png")
    } map { [ $_ , md5_hex($users{$_}) ] } keys %users;