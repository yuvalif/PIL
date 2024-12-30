function tail(filename)
  local f = assert(io.open(filename, "r"))
  local size = f:seek("end")
  local block_size = 2^13
  local last_line = ""
  if size and size > block_size then
    f:seek("end", -block_size)
    while true do
      local line = f:read("l")
      if not line then break end
      last_line = line
    end
  else
    f:seek("set")
    while true do
      local line = f:read("l")
      if not line then break end
      last_line = line
    end
  end
  return last_line
end

function non_optimized_tail(filename)
  local f = assert(io.open(filename, "r"))
  local last_line = ""
  while true do
    local line = f:read("l")
    if not line then break end
    last_line = line
  end
  return last_line
end

local filename = "pg10.txt"

local t1 = os.clock()
print(tail(filename))
local t2 = os.clock()
print("optimized tail took: "..tostring(t2 - t1).."s")

t1 = os.clock()
print(non_optimized_tail(filename))
t2 = os.clock()
print("non optimized tail took: "..tostring(t2 - t1).."s")

print(tail("ex7.4.lua"))
print(non_optimized_tail("ex7.4.lua"))

-- this is the last line of this file
