# Program reads from stdin: part2.nim < input.txt
import std/sequtils

let grid = toSeq(stdin.lines)

proc countTrees(stepsX, stepsY: int): int =
    var x, y, = 0
    while y < high(grid):
        inc(y, stepsX)
        inc(x, stepsY)
        let cyclicX = x mod len(grid[0])
        if grid[y][cyclicX] == '#':
            inc(result)

var prod = 1
for (stepX, stepY) in [(1,1), (1,3), (1,5), (1,7), (2,1)]:
    prod *= countTrees(stepX, stepY)
echo prod
