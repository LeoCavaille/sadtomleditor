my $infile = $ARGV[0];
my $outfile = $ARGV[1];
my $match = $ARGV[2];

open IFH, "<", $infile;
open OFH, ">", $outfile;
select OFH;
$/ = "\n[[";
my @sections = <IFH>;
my $n = 0;
foreach (@sections) {
    chomp;
    s/^/\n[[/ unless $n++ == 0;
    s/^(?!#|$)/#/gm if /$match/;
    print;
}
