#!/usr/bin/perl
use strict;
use warnings;

open IN, '<', "./chloroplasts_n_reads2.txt";
while (<IN>) {
    my ($reads, $chloroplast) = split /\s+/, $_;
    system "/usr/local/bowtie2/latest/bin/bowtie2-build $chloroplast $chloroplast.bt2";
    system "/usr/local/bowtie2/latest/bin/bowtie2 -x $chloroplast.bt2 -U $reads -p 8 -f --un ./$chloroplast.cpFree.fa";
}
