function all_but_first(...)
  return select(2, ...)
end

print(all_but_first("hello", "world", 1, 2, 3, nil))
print(all_but_first("hello"))
print(all_but_first())
