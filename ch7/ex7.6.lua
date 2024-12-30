-- create a directory
function mkdir(dirname)
  return os.execute("mkdir "..dirname)
end

-- remove a directory
function rmdir(dirname)
  return os.execute("rmdir "..dirname)
end

-- list a directory
function ls(dirname)
  local f = io.popen("ls -la "..dirname, "r")
  local entries = {}
  for entry in f:lines() do
    table.insert(entries, entry)
  end
  return entries
end

mkdir("/tmp/kaboom")
rmdir("/tmp/kaboom")

for i, file in ipairs(ls(".")) do
  print(file)
end

