#!/usr/bin/env luajit

package.path = (arg[0]:match("@?(.*/)") or arg[0]:match("@?(.*\\)")) .. "lib" .. package.config:sub(1, 1) .. "?.lua;" .. package.path
local utility = require "utility"

local items = {}
utility.ls("secret-journal")(function(file_name)
  items[#items + 1] = file_name
end)

local results = {}
for i = 1, 3 do
  local index = math.random(#items)
  results[i] = table.remove(items, index)
end

for _, item in ipairs(results) do
  print(item)
  os.execute("mv " .. ("secret-journal/" .. item):enquote() .. " upload/")
end
