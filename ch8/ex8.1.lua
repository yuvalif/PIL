-- with elseif
function op1(op, a, b)
  local r = 0
  if op == "+" then
    r = a+b
  elseif op == "-" then
    r = a-b
  elseif op == "*" then
    r = a*b
  elseif op == "/" then
    r = a/b
  else
    print("invalid operation "..op)
    return
  end
  print(tostring(a)..op..tostring(b).." = "..tostring(r))
end


-- without elseif code is less readable
function op2(op, a, b)
  local r = 0
  if op == "+" then
    r = a+b
  else if op == "-" then
    r = a-b
  else if op == "*" then
    r = a*b
  else if op == "/" then
    r = a/b
  else
    print("invalid operation "..op)
    return
  end
  end
  end
  end
  print(tostring(a)..op..tostring(b).." = "..tostring(r))
end

-- without elseif - using indentation does not make its much better
--[[
function op2(op, a, b)
  local r = 0
  if op == "+" then
    r = a+b
  else 
    if op == "-" then
      r = a-b
    else 
      if op == "*" then
        r = a*b
      else 
        if op == "/" then
          r = a/b
        else
          print("invalid operation "..op)
          return
        end
      end
    end
  end
  print(tostring(a)..op..tostring(b).." = "..tostring(r))
end
]]--

op1("+", 2, 3)
op2("+", 2, 3)
op1("-", 2, 3)
op2("-", 2, 3)
op1("*", 2, 3)
op2("*", 2, 3)
op1("/", 2, 3)
op2("/", 2, 3)
op1("$", 2, 3)
op2("$", 2, 3)

