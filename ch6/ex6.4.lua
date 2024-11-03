function swap(x, y)
  return y, x
end

-- Fisher-Yates Shuffle Algorithm
-- see: https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
function shuffle(...)
  local t = table.pack(...)
  local len = select("#", ...)
  for i = len, 2, -1 do
    local j = math.random(1, i)
    t[i], t[j] = swap(t[i], t[j])
  end
  return table.unpack(t)
end

print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
print(shuffle(1, 2, 3, 4, 5, 6, nil))
