function issequence(t)
  local len = 0
  for k,v in ipairs(t) do
    len = len + 1
  end
  return len == #t
end

-- valid sequence
local t = {"a", "b", "c", "d"}
print(issequence(t))

-- nil at the end is not considered a "hole"
local t = {"a", "b", "c", "d", nil}
print(issequence(t))

-- nil at the beginning is considered a "hole"
local t = {nil, "a", "b", "c", "d"}
print(issequence(t))

-- sequence with a "hole"
local t = {"a", "b", nil, "c", "d", nil}
print(issequence(t))

-- same as {"a", "b", "c", "d"}
local t = {[1] = "a", [2] = "b", [3] = "c", [4] = "d"}
print(issequence(t))

-- keys are not 1...n, so sequence is of size zero
local t = {[-1] = "a", [0] = "b", [2] = "c", [3] = "d"}
print(issequence(t))

-- keys are 1...n but 3 is missing
local t = {[1] = "a", [2] = "b", [4] = "c", [5] = "d"}
print(issequence(t))

-- keys are not 1...n missing key is after the end of the sequence
local t = {[1] = "a", [2] = "b", [5] = "c", [6] = "d"}
print(issequence(t))

-- non numeric keys are skipped
local t = {"a", hello = "a", "b", world = "b", "c", "d", nil}
print(issequence(t))

local a = {}

-- non numeric keys are skipped, even if value is nil (variable "c" is undefined)
local t = {"a", hello = a, "b", world = c, "c", "d", nil, goodbye = "e"}
print(issequence(t))

-- nil value in the middle of the sequence 
local t = {"a", hello = a, "b", world = c, c, "c", "d", nil}
print(issequence(t))
