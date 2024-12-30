function filesort(ifile, ofile)
  if ofile then
    local f = io.open(ofile, "r")
    if f then
      io.write(ofile, " already exists. do you want to overwrite [y/N]? ")
      local answer = io.read(1)
      f:close()
      if not answer or string.lower(answer) ~= "y" then
        io.write("Note: not overwriting file!\n")
        return
      end
      io.write("Note: file will be overwritten!")
    end
  end
  local icurrent = io.input()
  local ocurrent = io.output()
    
  -- save state of default input/output
  io.input(ifile)
  io.output(ofile)

  t = {}
  for l in io.lines() do
    table.insert(t, l)
  end

  table.sort(t)
  
  for _, l in ipairs(t) do
    io.write(l, "\n")
  end

  -- resore default input/output to original state
  io.input(icurrent)
  io.output(ocurrent)
end

local temp = os.tmpname()
-- in posix systems the file is actually created here
-- so, it must be removed so it won't exist when calling "filesort()"
os.remove(temp)
-- this call should not prompt a question
filesort("ex7.2.lua", temp)

temp = os.tmpname()
-- make sure to create file in non-posix systems
io.open(temp, "w")
-- this call should prompt a question
filesort("ex7.2.lua", temp)
os.remove(temp)

-- output to stdout
filesort("ex7.2.lua")

-- input/output from/to stdout
print("\nuse Ctrl-D to indicate EOF")
filesort()

