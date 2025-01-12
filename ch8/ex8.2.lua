local method = 'goto'

if method == 'while' then
  -- my favorite way
  while true do
    print("looping forever using '"..method.."' !")
    os.execute("sleep 1")
  end
elseif method == 'repeat' then
  repeat
    print("looping forever using '"..method.."' !")
    os.execute("sleep 1")
  until false
elseif method == 'for' then
  for i = 1, math.huge do
    print("looping forever using '"..method.."' !")
    os.execute("sleep 1")
  end
elseif method == 'goto' then
  ::redo::
  print("looping forever using '"..method.."' !")
  os.execute("sleep 1")
  goto redo
else
  print("invalid method "..method)
end

