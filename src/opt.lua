-- Options.
local function centerPrint(text)
  msgLen = string.len(text)
  screenWidth,_ = term.getSize()
  xCoords = tonumber(math.ceil((screenWidth / 2) - (msgLen / 2)))
  _,termY = term.getCursorPos()
  term.setCursorPos(xCoords, termY)
  print(text)
  return xCoords
end

local function options()
  local place = 1
  while true do
    term.setTextColor(colors.green)
    term.setBackgroundColor(colors.gray)
    term.clear()
    term.setCursorPos(1, 1)
    print("Security Options")
    print("")
    term.setTextColor(colors.yellow)
    if place == 1 then
      centerPrint("> Open Door <")
      centerPrint("Edit Redstone")
      centerPrint("Administration")
      centerPrint("Developer Tools")
    elseif place == 2 then
      centerPrint("Open Door")
      centerPrint("> Edit Redstone <")
      centerPrint("Administration")
      centerPrint("Developer Tools")
    elseif place == 3 then
      centerPrint("Open Door")
      centerPrint("Edit Redstone")
      centerPrint("> Administration <")
      centerPrint("Developer Tools")
    elseif place == 4 then
      centerPrint("Open Door")
      centerPrint("Edit Redstone")
      centerPrint("Administration")
      centerPrint("> Developer Tools <")
    end
    _, key = os.pullEvent("key")
    if key == keys.up and place > 1 then  
      place = place - 1
    elseif key == keys.down and place < 4 then
      place = place + 1
    elseif key == keys.enter then
      break
    end
  end
  if place == 1 then
    -- Open Door
    shell.run("/.bman/pass/door")
  elseif place == 2 then
    shell.run("/.bman/pass/rs")
  elseif place == 3 then
    shell.run("/.bman/pass/admin")
  elseif place == 4 then
    shell.run("/.bman/pass/dev")
  end
end

options()