#!/usr/bin/env lua

local sh = require('sh')
local argparse = require('argparse')
local adbplus = sh.command('/Users/knezzz/.adbplus.lua')


local loadFile = '' -- Premade file to read
local permissions = {} -- Permissions that need to be granted
local packageName = '' -- Package name

local parser = argparse("capp", "Clear app data and grant permissions"):require_command(false)
parser:option("-f --file"):description("File with package name and permissions for app"):convert(io.open)
parser:option("-a --app"):description('App package name'):argname('<package>')
parser:option("-p --permissions"):description("List permissions you want to grant/revoke (-a has to be specified)"):args('*'):argname('<permissions>')
parser:mutex(
	parser:flag("-g --grant-permissions"):description("Grant permissions (-p has to be specified)"),
	parser:flag("-r --revoke-permissions"):description("Revoke permissions (-p has to be specified)")
)
parser:flag("-l --leave-data"):description("Leave app data")
local args = parser:parse()

-- '2>/dev/null' rederects stdout to null so messages from adb command are not shown
-- Needed some command on android that will return error on adb if no devices are connected 
-- so 'shell exit' looked like it won't cause any trouble and it should run fine on all devices
local adbDevices = adbplus('-a shell exit', '2>/dev/null')
if adbDevices.__exitcode ~= 0 then
	print('No devices connected to adb!')
	os.exit()
end

function readFromFile()
	packageName = loadFile:read()
	while 1 do
		local l = loadFile:read()
	    table.insert(permissions,l)
	    if not l then break end
	end
end

if args.permissions ~= nil and args.app == nil then
	parser:error("option '-p' can not be used without the option '-a'")
	-- parser terminates the script here so no need for os.exit()
end

if args.file ~= nil then
	loadFile = args.file
	readFromFile()
elseif args.app ~= nil then
	packageName = args.app
	if args.permissions ~= nil then
		for i = 1, #args.permissions do
			table.insert(permissions, args.permissions[i])
		end
	end
else
	os.exit()
end

if not args.leave_data then
	local clearAppResult = adbplus('-a shell pm clear', packageName)
	print('Clearing app data for ', packageName)
end

for i = 1, #permissions do
	if args.revoke_permissions then
		permisResult = adbplus('-a shell pm revoke', packageName, permissions[i])
		print('Revoking permission: ', permissions[i])
	else
		permisResult = adbplus('-a shell pm grant', packageName, permissions[i])
		print('Granting permission: ', permissions[i])
	end
end

if packageName ~= nil then
	local clearAppResult = adbplus('-a shell monkey -p ', packageName, '-c android.intent.category.LAUNCHER 1')
	print('Starting the app!')
end
