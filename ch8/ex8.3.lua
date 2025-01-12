-- based on the example from section 7.1
-- print the first non-empty line

-- using a while loop
local line = io.read()
while line == "" do
  line = io.read()
end
print("first non-empty line is:", line)


-- using a repeat loop (more readable code)
local line
repeat
  line = io.read()
until line ~= ""
print("first non-empty line is:", line)

