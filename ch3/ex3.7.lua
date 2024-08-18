-- generate pseudo random numbers from a standard normal distribution using a uniform pseudo random number generator
-- using "box muller" algorithm (https://en.wikipedia.org/wiki/Box-Muller_transform)
function rand_normal()
  repeat
    u1 = math.random()
    u2 = math.random()
    r = u1^2 + u2^2
  until r ~= 0.0 and r < 1.0

  mag = (-2.0*math.log(u1))^0.5
  return mag*math.cos(2.0*math.pi*u2), mag*math.sin(2.0*math.pi*u2)
end

function round(x)
  return math.floor(x+0.5)
end

hist = {}
max_hist = 10
-- initialize the histogram
for i = 1, 2*max_hist do
  hist[i] = 0
end

-- populate the histogram
for i = 1, 100000 do
  z1, z2 = rand_normal(0, sigma)
  -- truncate the z1, z2 within the limits of the histogram
  z1 = math.min(math.max(z1, -max_hist), max_hist)
  z2 = math.min(math.max(z2, -max_hist), max_hist)
  -- calculate the bin of the histogram
  bin1 = round(z1)+max_hist
  bin2 = round(z2)+max_hist

  hist[bin1] = hist[bin1] + 1
  hist[bin2] = hist[bin2] + 1
end

-- print the histogram
for i = 1, 2*max_hist do
  print(i-max_hist, hist[i])
end
