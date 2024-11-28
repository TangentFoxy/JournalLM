#!/usr/bin/env luajit

local success, utility = pcall(function()
  -- return dofile((arg[0]:match("@?(.*/)") or arg[0]:match("@?(.*\\)")) .. "utility-functions.lua")
  return dofile("C:\Users\Public\.lua-files\utility-functions.lua")
end)
if not success then
  print("\n\n" .. tostring(utility) .. "\n\n")
  error()
end

math.randomseed(os.time())
local items = {}
utility.ls(".")(function(file_name)
  items[#items + 1] = file_name
end)

local results = {}
for i = 1, 3 do
  local index = math.random(#items)
  results[i] = table.remove(items, index)
end

for _, item in ipairs(results) do
  print(item)
  os.execute("mv " .. item:enquote() .. " upload/")
end
