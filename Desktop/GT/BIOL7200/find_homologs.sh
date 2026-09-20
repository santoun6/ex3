#!/bin/bash

# assignments line
QUERY=$1
SUBJECT=$2
OUTPUT=$3

# use blastn filter using column numbers
tblastn -query "$QUERY" -subject "$SUBJECT" -outfmt "6 std qlen" | \
awk '$3 > 30 && $4 >= 0.9 * $13' > "$OUTPUT"

# print number of matches 
wc -l < "$OUTPUT"
