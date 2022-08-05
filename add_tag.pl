#! /usr/bin/perl

use IO::File;

my $tag = shift @ARGV;
my $value = shift @ARGV;

for $fname (@ARGV) {
	my $fh = new IO::File("$fname");
	my $fh_d = new IO::File("> $fname.tmp");

	my $sep_idx = 0;
	while (<$fh>) {
		if (/^\s*---\s*$/) {
			$sep_idx ++;
			print $fh_d "$tag: $value\n" if $sep_idx == 2;
		}

		# Not in FrontMatter
		if ($sep_idx != 1) {
			print $fh_d $_;
			next;
		}

		# eventually remove the search one
		unless (/^\s*$tag:\s*(.+)\s*$/) {
			print $fh_d $_;
			next;
		}

	}
	rename ("$fname.tmp", "$fname");
}
