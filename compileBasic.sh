#!/bin/bash

#Process script using pattern
sed -r -f pattern.sed $1 > cfile.c

#Remove repeated lines (to avoid double variable declaration)
sed -i -n 'G; s/\n/&&/; /^\(int\s\w*;\n\).*\n\1/d; s/\n//; h; P' cfile.c

#Compile C file
outfile=$(printf "%s" "$1" | sed -r "s/(\w+)\.\w+/\1.o/")
gcc cfile.c -o $outfile

#Clean workspace
rm cfile.c
