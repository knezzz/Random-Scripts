#!/usr/bin/env lua

-- .adbplus.lua is required for this script
-- Rewrite of my sleep.sh command to LUA

local sh = require('sh')

local adbplus = sh.command('/Users/knezzz/.adbplus.lua')

local goToSleep = arg[1]
local action = 'Locking'

if goToSleep == 'test' then
	action = 'Testing'
elseif goToSleep == 's' then
	action = 'Sleeping'
end

-- Turret sound is located in /Users/knezzz/Music/iTunes/iTunes Media/Music/Unknown Artist/Unknown Album/turret.aiff
osascript('-e', '\'display notification "' .. action .. '.." with title "GLaDOS" subtitle "But ill be still alive"  sound name "turret"\'')
print('Okay...')
sleep(1)

-- Commands have __exitcode that show if command executed properly (0 is success) 
-- keyevent 26 is lock button on android devices
-- '2>/dev/null' rederects stdout to null so messages from adb command are not shown 
local result = adbplus('-a', 'shell input keyevent 26')
io.write(result.__input)
if(result.__exitcode ~= 0) then
	print('No devices connected to adb')
end

if (goToSleep == 'test') then
	print('LUA Script')
	print('Looks like everything is working! :)')
	sleep(.5)
elseif (goToSleep == 's') then
	-- Go to sleep
	print('Going to sleep..')
	sleep(.5)
	pmset('sleepnow')
else
	-- Start screensaver, find a way to tell BIONIC that computer is not is use.
	print('Starting The search for extraterrestrial intelligence..')
	sleep(.5)
	open('-a', '/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app')
end
