os.pullEvent = os.pullEventRaw
local h = fs.open("/.bman/pass/pass", "r")
local password = h.readAll()
h.close()
local function clear()
  term.setBackgroundColor(colors.gray)
  term.clear()
  term.setCursorPos(1, 1)
end

term.setTextColor(colors.yellow)
clear()
print("Industrial Security by Bman")
print("")
print("Please enter your password.")
print("")
term.setTextColor(colors.red)
term.write(">: ")
local input = read("*")
if input == password then
  shell.run("/.bman/pass/opt")
else
  print("Password Not Correct.")
  sleep(2)
  os.reboot()
end