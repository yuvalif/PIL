local newdir = "/tmp/kaboom/"
os.execute("mkdir -p "..newdir)

-- directory is modified only in the execute call
os.execute("cd "..newdir.." && pwd") -- this should print "/tmp/kaboom"
os.execute("pwd") -- this should print the current directory

-- parent pid of the "popen" call is the pid of the lua script
local pidf = io.popen("echo $PPID")
for pid in pidf:lines() do
  -- use a hack taken from here: https://rudd-o.com/linux-and-free-software/the-shell-challenge-changing-another-process-working-directory
  -- this assumes that gdb exists on the system
  local cmd = "gdb -ex 'attach "..pid.."' -ex 'call (int) chdir(\""..newdir.."\")' -ex 'detach' -ex 'quit' > /dev/null"
  os.execute(cmd)
  break
end

os.execute("pwd") -- this should print "/tmp/kaboom"

