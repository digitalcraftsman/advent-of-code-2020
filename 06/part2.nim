# Program reads from stdin: part2.nim < input.txt
import std/[sequtils, strutils, sets, sugar]

var acc = 0
for group in stdin.readAll().split("\n\n"):
  var lines = group.split("\n").map(x => x.replace("\n").toHashSet)
  var inter = lines[0]

  for line in lines[1..^1]:
    if line.len == 0: continue
    inter = inter * line
  acc += inter.len

echo acc
