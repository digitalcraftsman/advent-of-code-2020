# Program reads from stdin: part1.nim < input.txt
import std/strutils

var n = 0
for line in stdin.lines:
    let 
      s = line.split({'-', ' ', ':'})
      min = s[0].parseInt
      max = s[1].parseInt
      freq = s[4].count(s[2])
      
    if min <= freq and freq <= max: inc(n)
    
echo n
