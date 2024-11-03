function print_array(a)
  print(table.unpack(a))
end

print_array({1, 2, 3, 4, 5, 6})
print_array({1, 2, 3, 4, nil, 6})
print_array({1, 2, 3, 4, nil, 6, nil, nil})
