local function clear()
  term.setTextColor(colors.yellow)
  term.setBackgroundColor(colors.gray)
  term.clear()
end

clear()
term.setCursorPos(1, 1)
print("Modifying the REDSTONE OUTPUT.")
print("Please type a side of the computer that the output is on.")
print("CASE SENSITIVE!")
print("Valid sides: left, right, front, back, bottom, top")
term.setTextColor(colors.red)
term.write(">: ")
local input = read()
fs.delete("/.bman/pass/side")
local h = fs.open("/.bman/pass/side", "w")
h.write(input)
h.close()
print("")
print("")
sleep(4)
shell.run("/.bman/pass/opt")