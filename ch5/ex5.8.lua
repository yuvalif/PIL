function concat(l)
  local output = ""
  for k,v in ipairs(l) do
    output = output..v
  end

  return output
end

local input = {"hello"," ", "world"}

print(table.concat(input))

print(concat(input))

local input = {}

for i = 1, 200000 do
  input[i] = "goodbye"
end

local t1 = os.clock()
local output = table.concat(input)
local t2 = os.clock()
print("table.concat took: "..tostring(t2 - t1).."s")

local t1 = os.clock()
local output = concat(input)
local t2 = os.clock()
print("concat took: "..tostring(t2 - t1).."s")

