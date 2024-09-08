-- return a string where the "len" charecters are removed from "s" starting at position "pos"
-- the function expects a positive "len", and return nil otherwise
function remove(s, pos, len)
  if len < 0 then
    return nil
  end
  return string.format("%s%s", 
    string.sub(s, 1, pos-1), 
    string.sub(s, pos+len, -1))
end

print(remove("hello world", 7, 4))
print(remove("hello world", 7, 99))
print(remove("hello world", -7, 4))
print(remove("hello world", 7, -4))
print(remove("hello world", 7, 0))
