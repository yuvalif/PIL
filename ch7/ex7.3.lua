function copy_bytes() 
  while true do
    local byte = io.read(1)
    if not byte then break end
    io.write(byte)
  end
end

function copy_lines() 
  while true do
    local line = io.read("L")
    if not line then break end
    io.write(line)
  end
end

function copy_blocks() 
  while true do
    local block = io.read(2^13)
    if not block then break end
    io.write(block)
  end
end

-- this would usually be less efficient than 
-- the 8K block copy, due to the large memory allocation
function copy_whole() 
  io.write(io.read("a"))
end

local filename = "pg10.txt"

local icurrent = io.input()
local ocurrent = io.output()

io.input(filename)
io.output("copy_of_"..filename)

local t1 = os.clock()
copy_bytes()
local t2 = os.clock()
print("byte by byte copy took: "..tostring(t2 - t1).."s")

io.input(filename)
io.output("copy_of_"..filename)

t1 = os.clock()
copy_lines()
t2 = os.clock()
print("line by line copy took: "..tostring(t2 - t1).."s")

io.input(filename)
io.output("copy_of_"..filename)

t1 = os.clock()
copy_blocks()
t2 = os.clock()
print("8K block copy took: "..tostring(t2 - t1).."s")

io.input(filename)
io.output("copy_of_"..filename)

t1 = os.clock()
copy_whole()
t2 = os.clock()
print("copy whole file took: "..tostring(t2 - t1).."s")

io.input(icurrent)
io.output(ocurrent)
 -- cleanup
os.remove("copy_of_"..filename)

