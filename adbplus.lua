#!/usr/bin/env lua

-- Rewrite of adb+ in lua

sh = require('sh')

local adbCommand = nil

function showHelp()
	print('Usage: adb+ [-a] <command>')
	print('       -h: show help')
	print('       -a: run command on all device')
	print('  command: normal adb commands')
	print()
	print('Examples:')
	print('  adb+ -a install apidemo.apk')
	print('  adb+ shell')
end

function getAllArguments(i)
	for count = i, #arg do
		if adbCommand == nil then
			adbCommand = arg[count]
		else
			adbCommand = adbCommand .. ' ' .. arg[count]
		end
	end
end

function magiclines(s)
        if s:sub(-1)~="\n" then s=s.."\n" end
        return s:gmatch("(.-)\n")
end

if arg[1] == '-h' then
	showHelp()
	os.exit()
end

if(arg[1] == '-a') then
	getAllArguments(2)
else
	getAllArguments(1)
end

-- Get all devices connected to adb
local devices = adb('devices -l').__input
local connectedDevices = {}

function runOnAllDevices()
	for deviceCount = 1, #connectedDevices do
		local deviceSerialNumber = awk(echo(connectedDevices[deviceCount]), "'{print $1}'").__input
		local command = string.gsub('-s ' .. deviceSerialNumber .. ' ' .. adbCommand,'\n', '')

		local infoMess = string.gsub('Executing command \'' .. adbCommand .. '\' on ' .. awk(echo(connectedDevices[deviceCount]), "'{print $3}'").__input,'\n','')
		print(infoMess)

		result = adb(command)
		if(result.__input ~= nil and result.__input ~= '') then
			print(result.__input)
		end
	end

	os.exit()
end

for line in magiclines(devices) do
	if(line ~= nil and string.find(awk(echo(line), "'{print $2'}").__input, 'device')) then
		local device = awk(echo(line), "'{print $1 \" - \" $5'}").__input
		table.insert(connectedDevices, device)
	end
end

if #connectedDevices == 0 then
	print('No devices connected to adb')
	os.exit()
end

-- If just one device is connected then call adb with all arguments
if #connectedDevices == 1 then
	print('Just one device connected!\nForwarding commands to adb!\n')
	adbCommand = string.gsub(adbCommand, '-a', '')
	local infoMess = string.gsub('Executing command \'' .. adbCommand .. '\' on ' .. awk(echo(connectedDevices[#connectedDevices]), "'{print $3}'").__input,'\n','')
	print(infoMess)
	result = adb(adbCommand)
	if(result.__input ~= nil and result.__input ~= '') then
		print(result.__input)
	end
	os.exit()
end

-- If '-a' is specified then commands will run on all devices
if arg[1] == '-a' then
	adbCommand = string.gsub(adbCommand, '-a', '')
	runOnAllDevices()
end

-- Select device to run commands
table.insert(connectedDevices, 'all')
ipairs(connectedDevices)

for deviceCount = 1, #connectedDevices do
	local deviceMess = string.gsub(awk(echo(connectedDevices[deviceCount]), "'{print '" .. deviceCount .. "'\") - \"$1 \" - \" $3}'").__input,'\n','');
	print(deviceMess)
end

io.write('\nPlease enter number: ')
local input = io.read("*n")

if input > #connectedDevices then
	print('Device doesn\'t exist')
	os.exit()
end

if input == #connectedDevices then
	table.remove(connectedDevices)
	runOnAllDevices()
else
	local infoMess = string.gsub('Executing command \'' .. adbCommand .. '\' on ' .. awk(echo(connectedDevices[input]), "'{print $3}'").__input,'\n','')
	print(infoMess)
	local deviceSerialNumber = awk(echo(connectedDevices[input]), "'{print $1}'").__input
	local command = string.gsub('-s ' .. deviceSerialNumber .. ' ' .. adbCommand,'\n', '')
	result = adb(command)
	if(result.__input ~= nil and result.__input ~= '') then
		print(result.__input)
	end
end
