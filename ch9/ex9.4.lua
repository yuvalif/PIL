function plot(r, M, N)
  io.write("P1\n", M, " ", N, "\n") -- header
  for i = 1, N do -- for each line
    local y = (N - i*2)/N
    for j = 1, M do -- for each column
      local x = (j*2 - M)/M
      io.write(r(x, y) and "0" or "1")
    end
    io.write("\n")
  end
end

-- return a disk function according to center and radius
function disk(cx, cy, r)
  return function (x, y)
    return (x - cx)^2 + (y - cy)^2 <= r^2
  end
end

-- return an area difference function of r1 - r2
function difference(r1, r2)
  return function (x, y)
    return r1(x, y) and not r2(x, y)
  end
end

-- return an area function which shifts the original
-- region r by dx and dy on the x and y axis
function translate(r, dx ,dy)
  return function (x, y)
    return r(x - dx, y - dy)
  end
end

-- northern hemisphere moon phases
function moonphase(day)
  -- full moon with radius 1 at the origin
  local full = disk(0, 0, 1)
  if day < 1 or day > 28 then
    error("day must be between 1 - 28")
  end
  local shift = (day - 14)/7
  io.output(tostring(day)..".bpm")
  plot(difference(full, translate(full, -shift, 0)), 500, 500)
end

-- plot moon phases for all days of the lunar month
for day = 1, 28 do
  moonphase(day)
end

