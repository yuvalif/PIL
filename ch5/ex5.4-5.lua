-- calculate polynomial value for x
function polynomial1(p, x)
  local sum = 0
  for i,k in pairs(p) do
    sum = sum + k*x^(i-1)
  end
  return sum
end

-- calculate polynomial value for x without using exponent
-- with n additions and 2n multiplications
function polynomial2(p, x)
  local sum = 0
  local multiplier = 1
  for i,k in pairs(p) do
    if i > 1 then 
      multiplier = multiplier*x
    end
    sum = sum + k*multiplier
  end
  return sum
end

-- 2.3x^2 - 7x - 5
local p = {-5, -7, 2.5}
print(polynomial1(p, -2))
print(polynomial2(p, -2))

-- -x^4 + 3.2x^3 + 2.3x^2 - 7x - 5
local p = {-5, -7, 2.3, 3.2, -1}
print(polynomial1(p, -2))
print(polynomial2(p, -2))
