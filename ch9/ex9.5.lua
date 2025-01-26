function plot(r, M, N)
  io.write("P1\n", M, " ", N, "\n") -- header
  for i = 1, N do -- for each line
    local y = (N - i*2)/N
    for j = 1, M do -- for each column
      local x = (j*2 - M)/M
      io.write(r(x, y) and "1" or "0")
    end
    io.write("\n")
  end
end

-- return a rectangle function according to 4 border lines
function rect(left, right, bottom, up)
  return function (x, y)
    return left <= x and x <= right and
      bottom <= y and y <= up
  end
end

-- return an area function which rotate the original
-- region r by angle alpha
-- see: https://en.wikipedia.org/wiki/Rotation_of_axes_in_two_dimensions
function rotate(r, alpha)
  return function (x, y)
    return r(x*math.cos(alpha) + y*math.sin(alpha), -x*math.sin(alpha) + y*math.cos(alpha)) 
  end
end

local N = 8
for i = 0, N-1 do
  io.output("rect"..tostring(i)..".bpm")
  plot(rotate(rect(0, 1, 0, 1), i*2*math.pi/N), 500, 500)
end

