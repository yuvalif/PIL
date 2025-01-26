-- indefinite integral function according to trapezoidal estimation
-- https://en.wikipedia.org/wiki/Trapezoidal_rule
function integral(f, dx)
  local dx = dx or 1e-4
  return function(x)
    local n = math.abs(x//dx)
    local S =  0.5*(f(0) + f(x))
    for i = 1, n do
      S = S + f(i*dx)
    end
    return dx*S
  end
end

print("sin(x)")
local estimatedF = integral(math.sin)
-- I(sin(x)) = -cos(x)
local actualF = function (x) return -math.cos(x) end
local x = math.pi/3
print(x, actualF(x), estimatedF(x))
x = math.pi/4
print(x, actualF(x), estimatedF(x))
x = math.pi/6
print(x, actualF(x), estimatedF(x))

print("cos(x)")
estimatedF = integral(math.cos)
-- I(cos(x)) = sin(x)
actualF = math.sin
x = math.pi/3
print(x, actualF(x), estimatedF(x))
x = math.pi/4
print(x, actualF(x), estimatedF(x))
x = math.pi/6
print(x, actualF(x), estimatedF(x))

print("x^2")
estimatedF = integral(function(x) return x^2 end)
-- I(x^2) = x^3/3
actualF = function (x) return x^3/3 end
x = 2
print(x, actualF(x), estimatedF(x))

