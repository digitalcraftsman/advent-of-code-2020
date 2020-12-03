# Program reads from stdin: part1.nim < input.txt
import std/sequtils

let grid = toSeq(stdin.lines)
var x, y, trees = 0

while y < high(grid):
    inc(y)
    inc(x, 3)
    let cyclicX = x mod len(grid[0])
    if grid[y][cyclicX] == '#':
        inc(trees)
echo trees
