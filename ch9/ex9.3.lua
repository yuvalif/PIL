-- calculate polynomial value for x
-- taken from exercise 5.4
function polynomial(p, x)
  local sum = 0
  for i,k in pairs(p) do
    sum = sum + k*x^(i-1)
  end
  return sum
end

function newpoly(p)
  return function (x)
    return polynomial(p, x)
  end
end

-- 2.3x^2 - 7x - 5
local p = {-5, -7, 2.5}
print(polynomial(p, -2))
print(newpoly(p)(-2))

-- -x^4 + 3.2x^3 + 2.3x^2 - 7x - 5
local p = {-5, -7, 2.3, 3.2, -1}
print(polynomial(p, -2))
print(newpoly(p)(-2))

