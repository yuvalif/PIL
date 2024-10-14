function issequence(t)
  local len = 0
  for k,v in ipairs(t) do
    len = len + 1
  end
  return len == #t
end

function insert(inlist, pos, outlist)
  if not issequence(inlist) or not issequence(outlist) then
    print("lists must be sequences!")
    return false
  end
  for k,v in ipairs(inlist) do
    table.insert(outlist, pos, v)
    pos = pos + 1
  end
  return true
end
 
function printlist(l)
  for k,v in ipairs(l) do
    io.write(tostring(v)..", ")
  end
  io.write("\n")
end

local l1 = {"a", "b", "c", "d", "e", "f"}
local l2 = {"1", "2", "3", "4", "5", "6"}
if insert(l1, 4, l2) then
  printlist(l2)
end

local l1 = {"a", "b", "c", "d", "e", "f"}
local l2 = {"1", "2", "3", "4", "5", "6"}
if insert(l2, 4, l1) then
  printlist(l1)
end

local l1 = {"a", "b", "c", "d", "e", "f"}
local l2 = {"1", "2", "3", "4", "5", "6"}
if insert(l1, 7, l2) then
  printlist(l2)
end

-- out of bounds
-- insert(l1, 8, l2)
-- insert(l1, 0, l2)

local l1 = {"a", "b", "c", "d", nil, "e", "f"}
local l2 = {"1", "2", "3", "4", "5", "6"}
if insert(l1, 4, l2) then
  printlist(l2)
end

local l1 = {"a", "b", "c", "d", "e", "f"}
local l2 = {"1", "2", "3", nil, "5", "6"}
if insert(l1, 2, l2) then
  printlist(l2)
end

local l1 = {"a", "b", "c", "d", "e", "f"}
local l2 = {"1", "2", "3", "4", "5", "6"}
if insert(l1, 1, l2) then
  printlist(l2)
end

