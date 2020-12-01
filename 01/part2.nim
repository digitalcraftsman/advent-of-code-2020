# Program reads from stdin: part2.nim < input.txt
import std/[strutils, sequtils, enumerate]

let numbers = toSeq(stdin.lines).map(parseInt)

for i, x in enumerate(numbers):
    for j, y in enumerate(numbers[..i]):
        for z in numbers[..j]:
            if x+y+z == 2020: echo x*y*z
