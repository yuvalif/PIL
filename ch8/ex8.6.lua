
-- original getlable() returning a function that jumps
-- to a label to return zero
--[[
function getlabel()
  return function () goto L1 end
  ::L1::
  return 0;
end
]]--

-- a similar, but not identical, getlable() version 
-- returning a function that return zero
function getlabel()
  return function () return 0 end
end

function f(n)
  if n == 0 then return getlabel()
  else
    local res = f(n - 1)
    print(res, n)
    return res
  end
end

x = f(10)
print("x() = ", x())
-- if the original getlable() was valid, the call to x()
-- would allow jumping into the function getlable()
-- which breaks the lua visibility rules
