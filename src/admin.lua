local function clear()
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.yellow)
    term.clear()
    term.setCursorPos(1, 1)
end

clear()
term.setTextColor(colors.green)
print("Administration")
term.setTextColor(colors.red)
print("WARNING: These changes can modify your system.")
term.setTextColor(colors.yellow)
print("Changing Your Password")
print("We recomend you change your password")
print("To continue, enter your current password.")
term.setTextColor(colors.red)
term.write(">: ")
local input = read("*")
local h = fs.open("/.bman/pass/pass", "r")
local password = h.readAll()
h.close()
if input == password then
  -- Continue
  shell.run("/.bman/pass/change")
else
  print("")
  print("Password incorrect.")
  sleep(3)
  shell.run("/.bman/pass/opt")
end