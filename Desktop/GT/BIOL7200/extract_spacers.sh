#!/bin/bash

query="$1"
subject="$2"
output="$3"

blastn -query "$query" -subject "$subject" -task blastn-short \
-outfmt "6 std qlen slen" | \
awk '$3 == 100 && $4 == $13' | \
sort -k2,2 -k9,9n | \
paste - - | \
awk '$2 == $16 { print $2 "\t" $10 "\t" ($23 - 1) }' | \
seqtk subseq "$subject" - > "$output"
