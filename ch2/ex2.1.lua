N = 8 -- board size

function isplaceok(a, n, c)
  -- check if position (n, c) is free from attacks
  for i = 1, n - 1 do -- for each queen in rows 1 to n
    if a[i] == c or  -- there is a queen in the same column
      a[i] - i == c - n or -- there is a queen in the same diagnal
      a[i] + i == c + n then -- there is a queen in the same diagnal
      -- place can be attacked
      return false
    end
  end
  -- place is ok
  return true
end

-- print a board
function printsolution(a)
  for i = 1, N do
    for j = 1, N do
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

-- set maxcount to nil to get all solutions
maxcount = nil

-- add to board 'a' all queens from row 'n' to 'N'
function addqueen(a, n, count, total)
  if maxcount and count == maxcount then
    -- 'maxcount' solutions already found
    return count
  end
  if n > N then
    -- all 'N' queens have been placed
    printsolution(a)
    return count + 1, total
  else
    -- try to place n-th queen
    for c = 1, N do
      total = total + 1
      if isplaceok(a, n, c) then
        a[n] = c -- place n-th queen at columns 'c'
        count, total = addqueen(a, n+1, count, total)
      end
    end
  end
  return count, total
end

count, total = addqueen({}, 1, 0, 0)

print(tostring(count)..' solutions found out of '..tostring(total)..' boards')
