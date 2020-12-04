# Program reads from stdin: part1.nim < input.txt
import std/[strutils, sequtils, sugar]

proc checkBirthYear(year: string): bool = 
  try: year.parseInt in 1920..2002 
  except: false
    
proc checkIssueYear(year: string): bool = 
  try: year.parseInt in 2010..2020 
  except: false

proc checkExpYear(year: string): bool =
  try: year.parseInt in 2020..2030 
  except: false
    
proc checkHeight(height: string): bool = 
  if height.endsWith("cm"):
    height[0..^3].parseInt in 150..193
  elif height.endsWith("in"): 
    height[0..^3].parseInt in 59..76
  else: false

proc checkHairColor(color: string): bool =
  color.len == 7 and
  color.startsWith('#') and 
  color[1..^1].all(c => c in {'0'..'9', 'a'..'f'})

proc checkEyeColor(color: string): bool =
  color in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

proc checkPassportID(id: string): bool =
  try: id.len == 9 and id.parseInt in 0..1000000000 
  except: false

proc checkPassport(raw: string): bool =
  let reqAttrs = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  var foundAttrs: seq[string]
  
  for pair in raw.split({'\n', ' '}):
    var s = pair.split(':')
    if pair != "" and s.len != 2: return false
    
    let valid = case s[0]:
      of "byr": checkBirthYear(s[1])
      of "iyr": checkIssueYear(s[1])
      of "eyr": checkExpYear(s[1])
      of "hgt": checkHeight(s[1])
      of "hcl": checkHairColor(s[1])
      of "ecl": checkEyeColor(s[1])
      of "pid": checkPassportID(s[1])
      of "cid": true
      else: continue

    foundAttrs.add(s[0])
    if not valid: return false
  result = reqAttrs.all(attr => attr in foundAttrs)

var validPassports = 0
for raw in stdin.readAll().split("\n\n"):
  if checkPassport(raw): inc(validPassports)
echo validPassports
