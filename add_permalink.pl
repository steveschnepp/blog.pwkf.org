#! /usr/bin/perl

use IO::File;
for $fname (@ARGV) {
	my $fh = new IO::File("$fname");
	my $fh_d = new IO::File("> $fname.tmp");
	while (<$fh>) {
		print $fh_d $_;
		print $fh_d "permalink: /post/$fname\n" if $_ =~ m/^tags: /;
	}
	rename ("$fname.tmp", "$fname");
}
