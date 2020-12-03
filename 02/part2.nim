# Program reads from stdin: part2.nim < input.txt
import std/strutils

var n = 0
for line in stdin.lines:
    var 
      s = line.split({'-', ' ', ':'})
      pos1 = s[0].parseInt
      pos2 = s[1].parseInt
      letter = s[2]

    if $s[4][pos1-1] == letter xor $s[4][pos2-1] == letter: 
      inc(n)
echo n
