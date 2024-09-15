function swap(x, y)
  return y, x
end

-- Heap's Algorithm for generating all possible permutations
-- based on: https://en.wikipedia.org/wiki/Heap%27s_algorithm
-- "operation" is applied on each permutation
function permutations(k, a, operation)
  if k == 1 then
    operation(a)
    return
  end
  for i = 1, k do
    permutations(k-1, a, operation)
    if k%2 == 0 then
      a[i], a[k] = swap(a[i], a[k])
    else
      a[1], a[k] = swap(a[1], a[k])
    end
  end
end

N = 8 -- board size

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

function issolutionok(a)
  for i = 1, N do -- go over all rows
    for j = 1, N do -- for the queen at row 'i' check all other queens
      if i ~= j then -- don't check a queen with itself
        if a[i] == a[j] or -- same column
          a[i] - i == a[j] - j or -- same diagonal
          a[i] + i == a[j] + j then -- same diagonal
          return false
        end
      end
    end
  end
  return true
end

-- set maxcount to nil to get all solutions
maxcount = nil

local total = 0
local count = 0

function checkpermutation(a)
  if maxcount and count == maxcount then
    -- 'maxcount' solutions already found
    return
  end
  total = total + 1
  if issolutionok(a) then
    printsolution(a)
    count = count +1
  end
end

-- create an array of the numbers {1, ..., N}
local arr = {}
for i = 1, N do
  arr[i] = i
end
permutations(N, arr, checkpermutation)

print(tostring(count)..' solutions found out of '..tostring(total)..' boards')
