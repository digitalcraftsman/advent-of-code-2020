# Program reads from stdin: part1.nim < input.txt
import std/[sequtils, strutils, sets, sugar, math]

echo stdin.readAll().split("\n\n").map(x => x.replace("\n").toHashSet.len).sum()
