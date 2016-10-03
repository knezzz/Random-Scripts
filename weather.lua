#!/usr/bin/env lua

local sh = require('sh')

local inputCity = 'Zagreb'

if arg[1] ~= nil then
	inputCity = ''
	for i = 1, #arg do
		inputCity = inputCity .. arg[i]
	end
end

local site = http('GET', 'http://wttr.in/' .. inputCity)
print(site.__input)
