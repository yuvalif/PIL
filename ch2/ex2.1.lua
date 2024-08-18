N = 8

function isplaceok(a, n, c)
  for i = 1, n-1 do
    if a[i] == c or 
      a[i]-i == c-n or 
      a[i]+i == c + n then
      return false
    end
  end
  return true
end

function printsolution(a)
  for i = 1, N do
    for j = 1, N do
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

maxcount = 1

function addqueen(a, n, count)
  if count == maxcount then
    return count
  end
  if n > N then
    printsolution(a)
    return count + 1
  else
    for c = 1, N do
      if isplaceok(a, n, c) then
        a[n] = c
        count = addqueen(a, n+1, count)
      end
    end
  end
  return count
end

count = addqueen({}, 1, 0)

print(tostring(count)..' solutions found')
