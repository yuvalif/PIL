function all_but_last(...)
  local t = table.pack(...)
  local len = select("#", ...) 
  return table.unpack(t, 1, len - 1)
end

print(all_but_last("hello", "world", 1, 2, 3, "goodbye"))
print(all_but_last("hello", "world", 1, 2, 3, "goodbye", nil))
print(all_but_last("hello"))
print(all_but_last())
