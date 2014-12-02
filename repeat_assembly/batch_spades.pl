#!/usr/bin/perl
use strict;
use warnings;

my @clusters = <*/*.fsa>;
for my $cluster (@clusters) {
    open OUT, '>', "$cluster.spades.sh";
    print OUT "#!/bin/bash\n";
    print OUT "/usr/local/spades/latest/bin/spades.py -s $cluster --only-assembler -t 2 -o $cluster\_spades";

    system "qsub -q rcc-30d -cwd -pe thread 2 -l mem_total=20G ./$cluster.spades.sh"
}
