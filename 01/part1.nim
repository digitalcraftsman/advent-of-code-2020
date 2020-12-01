# Program reads from stdin: part1.nim < input.txt
import std/[strutils, sequtils, enumerate]

let numbers = toSeq(stdin.lines).map(parseInt)

for i, x in enumerate(numbers):
    for y in numbers[..i]:
        if x+y == 2020: echo x*y
