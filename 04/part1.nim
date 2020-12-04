# Program reads from stdin: part1.nim < input.txt
import std/[strutils, sequtils, sugar]

let reqAttrs = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
var validPassports = 0

for raw in stdin.readAll().split("\n\n"):
    let passportAttrs = raw.split({'\n', ' ', ':'})
    if reqAttrs.all(attr => attr in passportAttrs):
        inc(validPassports)
        
echo validPassports
