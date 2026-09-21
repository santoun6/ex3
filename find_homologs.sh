cat << 'EOF' > find_homologs.sh
#!/usr/bin/env bash
tblastn -query "$1" -subject "$2" -outfmt '6 std qlen' | awk '$3 > 30 && $4 >= 0.9 * $13' > "$3"
wc -l < "$3"
EOF
