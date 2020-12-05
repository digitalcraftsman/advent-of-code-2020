# Program reads from stdin: part1.nim < input.txt
proc binSearch(top: int; str: string, chright: char): int =
  var top = top
  for c in str:
    let diff = (top - result) div 2
    if c == chright: top -= diff
    else: result += diff

var seats: seq[int]
for line in stdin.lines:
  let row = binSearch(128, line[0..6], 'F')
  let col = binSearch(8, line[7..^1], 'L')
  let seatID = row*8 + col
  seats.add(seatID)

echo max(seats)
