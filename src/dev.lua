-- This is to return to craftos
-- Only to be used by developers.

local function clear()
  term.setTextColor(colors.yellow)
  term.setBackgroundColor(colors.gray)
  term.clear()
  term.setCursorPos(1, 1)
end

clear()
print("WARNING: Developer Tools leaves the security system.")
print("Modifying any files may cause password system to crash.")
print("Because of this, please type your password to continue beyond this point.")
term.setTextColor(colors.red)
term.write(">: ")
local input = read("*")
local h = fs.open("/.bman/pass/pass", "r")
local stringy = h.readAll()
h.close()
if input == stringy then
  --Terminate shell.
  term.setBackgroundColor(colors.black)
  term.clear()
else
  clear()
  print("Password Incorrect.")
  sleep(3)
  shell.run("/.bman/pass/opt")
end