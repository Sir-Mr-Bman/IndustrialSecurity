local function clear()
	
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1, 1)
	term.setTextColor(colors.yellow)
	
end

-- GitGET Function
--
-- Written for Sir_Mr_Bman's GitHub
--

local function gitGet(file, save)
	
	if fs.exists("/dwnlds") then
		fs.delete("/dwnlds")
	end
	
	fs.makeDir("/dwnlds")
	term.setTextColor(colors.purple)
	print("[GitGET] Getting file: "..file)
	local response = http.get(
				"https://raw.githubusercontent.com/Sir-Mr-Bman/IndustrialSecurity/master/src/"..file..".lua"	
	)
	if response then
		print("[GitGET] Server responded. Downloading...")
		local save = response.readAll()
		response.close()
		local file = fs.open("/dwnlds/"..save, "w")
		file.write(save)
		file.close()
		print("[GitGET] File downloaded.")
	else
		print("[GitGET] Server did not respond. Is it offline?")
		print("[GitGET] Check your internet connection, and firewall settings.")
	end
	
end

-- Extract Function
--
-- Written to extract all files to their directories.
--

local function extract(from, to)
	term.setTextColor(colors.orange)
	if fs.exists(to) then
		fs.delete(to)
	end
	
	if not fs.exists(from) then
			print("[Extract] The file you are trying to extract does not exist.")
	end
	
	print("[Extract] Extracting file: "..from)
	fs.copy("/dwnlds/"..from, to)
	sleep(1)
	print("[Extract] Deleting old copy.")
	fs.delete("/dwnlds/"..from)
	
	
end

--[[ START MAIN CODE. ]]

--[[ Tests if term is advanced. ]]
if not term.isColor() then

	print("Sorry, but this program requires an advanced computer.")
	return
	
end

--[[ Tests if HTTP API is enabled.]]
if not http then
	print("Sorry, but this program requires the HTTP API to be enabled.")
	return
end

--[[ Clears screen ]]
clear()
	
--[[ Load files into GitGet]]
print("Getting file [1 / 9]")
gitGet("admin", "admin")
term.setTextColor(colors.yellow)
print("Getting file [2 / 9]")
gitGet("dev", "dev")
term.setTextColor(colors.yellow)
print("Getting file [3 / 9]")
gitGet("door", "door")	
term.setTextColor(colors.yellow)
print("Getting file [4 / 9]")
gitGet("rs", "rs)
term.setTextColor(colors.yellow)
print("Getting file [5 / 9]")
gitGet("side", "side")
term.setTextColor(colors.yellow)
print("Getting file [6 / 9]")
gitGet("pass", "pass")
term.setTextColor(colors.yellow)
print("Getting file [7 / 9]")
gitGet("startup", "startup")	
term.setTextColor(colors.yellow)
print("Getting file [8 / 9]")
gitGet("change", "change")
term.setTextColor(colors.yellow)
print("Getting file [9 / 9]")
gitGet("opt", "opt")
term.setTextColor(colors.yellow)
print("Got all files.")
sleep(3)

--[[ Extract files with Extract ]]
print("Extracting files into directories.")
print("Extracting file [1 / 9]")
extract("admin", "/.bman/pass/admin")
term.setTextColor(colors.yellow)
print("Extracting file [2 / 9]")
extract("dev", "/.bman/pass/dev")
term.setTextColor(colors.yellow)
print("Extracting file [3 / 9]")
extract("door", "/.bman/pass/door")
term.setTextColor(colors.yellow)
print("Extracting file [4 / 9]")
extract("rs", "/.bman/pass/rs")
term.setTextColor(colors.yellow)
print("Extracting file [5 / 9]")
extract("side", "side")
term.setTextColor(colors.yellow)
print("Extracting file [6 / 9]")
extract("pass", "/.bman/pass/pass")
term.setTextColor(colors.yellow)
print("Extracting file [7 / 9]")
extract("startup", "/startup")
term.setTextColor(colors.yellow)
print("Extracting file [8 / 9]")
extract("change", "/.bman/pass/change")
term.setTextColor(colors.yellow)
print("Extracting file [9 / 9]")
extract("opt", "/.bman/pass/opt")
term.setTextColor(colors.yellow)
print("Done.")
sleep(3)
print("Your default password is: password")
print("You may want to write this down.")
sleep(5)
print("Restarting...")
sleep(2)
os.reboot()