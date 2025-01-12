--[[

  N 
 W E
  S 

the maze:

|---|_|---|
| 1  _  2 |
|- -| |- -|
 | |   | |
|- -|_|- -|
| 3  _  4 |
|---| |---|

]]--


function room1()
  local move = io.read()
  if move == "south" then 
    return room3()
  elseif move == "east" then 
    return room2()
  end
  print("invalid move")
  return room1()
end

function room2()
  local move = io.read()
  if move == "south" then 
    return room4()
  elseif move == "west" then 
    return room1()
  end
  print("invalid move")
  return room2()
end

function room3()
  local move = io.read()
  if move == "north" then 
    return room1()
  elseif move == "east" then 
    return room4()
  end
  print("invalid move")
  return room3()
end

function room4()
  print("you won!")
end

room1()

