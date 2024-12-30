function open_with_default(mode, filename)
  if filename then
    return assert(io.open(filename, mode))
  end
  if mode == "r" then
    return io.stdin
  elseif mode == "w" then
    return io.stdout
  end
  assert(false)
end

function filesort(ifilename, ofilename)
  local ifile = open_with_default("r", ifilename)
  local ofile = open_with_default("w", ofilename)

  t = {}
  for l in ifile:lines() do
    table.insert(t, l)
  end

  table.sort(t)
  
  for _, l in ipairs(t) do
    ofile:write(l, "\n")
  end

  ifile:close()
  ofile:close()
end

-- input/output from/to files
filesort("ex7.1.lua", "sorted.ex7.1.lua")
os.execute("cat sorted.ex7.1.lua")
os.remove("sorted.ex7.1.lua")

-- output to stdout
filesort("ex7.1.lua")

-- input/output from/to stdout
print("\nuse Ctrl-D to indicate EOF")
filesort()

