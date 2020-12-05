# Program reads from stdin: part1.nim < input.txt
proc binSearch(bottom, top: var int; str: string, chright: char): int =
  for c in str:
    let diff = (top - bottom) div 2
    if c == chright: top -= diff
    else: bottom += diff
  return bottom

var maxSeatID: int
var seats: seq[int]
for line in stdin.lines:
  var (bottom, top) = (0, 128)
  let row = binSearch(bottom, top, line[0..6], 'F')

  var (bottom2, top2) = (0, 8)
  let col = binSearch(bottom2, top2, line[7..^1], 'L')
  
  let seatID = row*8 + col
  seats.add(seatID)
  maxSeatID = max(maxSeatID, seatID)

echo maxSeatID
