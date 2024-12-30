function tail(filename, n)
  local f = assert(io.open(filename, "r"))
  assert(n > 0)
  local size = f:seek("end")
  local block_size = 2^13
  local last_lines = {}
  local index = 1
  if size and size > block_size then
    -- start 8K before the end
    f:seek("end", -block_size)
    while true do
      local line = f:read("l")
      if not line then break end
      last_lines[index] = line
      index = index + 1
      if (index > n) then index = 1 end
    end
  end
  if #last_lines < n then
    -- go to the beginning
    f:seek("set")
    while true do
      local line = f:read("l")
      if not line then break end
      last_lines[index] = line
      index = index + 1
      if (index > n) then index = 1 end
    end
   end
  return last_lines
end

function non_optimized_tail(filename, n)
  local f = assert(io.open(filename, "r"))
  assert(n > 0)
  local last_lines = {}
  local index = 1
  while true do
    local line = f:read("l")
    if not line then break end
    last_lines[index] = line
    index = index + 1
    if (index > n) then index = 1 end
  end
  return last_lines
end

local filename = "pg10.txt"
local n = 5

local t1 = os.clock()
local lines = tail(filename, n)
local t2 = os.clock()
print("\noptimized tail took: "..tostring(t2 - t1).."s")
print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(lines) do
  print(line)
end

t1 = os.clock()
lines = non_optimized_tail(filename, n)
t2 = os.clock()
print("\nnon optimized tail took: "..tostring(t2 - t1).."s")
print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(lines) do
  print(line)
end

filename = "ex7.5.lua"

print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(tail(filename, n)) do
  print(line)
end
print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(non_optimized_tail(filename, n)) do
  print(line)
end

n = 100 -- more than the lines in this file

print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(tail(filename, n)) do
  print(line)
end
print("\nlast "..tostring(n).." lines of "..filename.." are:\n")
for _, line in ipairs(non_optimized_tail(filename, n)) do
  print(line)
end

-- this is the 5th last line of this file
-- this is the 4th last line of this file
-- this is the 3rd last line of this file
-- this is the 2nd last line of this file
-- this is the last line of this file
