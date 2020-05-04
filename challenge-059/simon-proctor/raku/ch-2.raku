#!/usr/bin/env raku

use v6;

multi sub bit-diff( UInt $a, UInt $b where $a >= $b ) {
    [+] ($a.base(2).comb.reverse Z (|$b.base(2).comb.reverse, |(lazy gather { take 0 }) ) ).map( { abs( $^a[0] - $^a[1] ) } );
}

multi sub bit-diff( UInt $a, UInt $b ) { bit-diff( $b, $a ) }

#| Give the sum of the differences in bits between all the combinations of inputs
sub MAIN (
    *@vals where { $_.all ~~ UInt } #= Integer values to combine
){
    say [+] @vals.combinations(2).map( { bit-diff( |@_ ) } );
}
