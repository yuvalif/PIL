-- return a string where the "len" utf8 charecters are removed from "s" starting at position "pos"
-- the function expects a positive "len" and valid position, and return nil otherwise
function remove(s, pos, len)
  if len < 0 then
    return nil
  end
  local realpos1 = utf8.offset(s, pos)
  local realpos2 = utf8.offset(s, pos+len)
  if not realpos1 or not realpos2 then
    return nil
  end
  return string.format("%s%s", 
    string.sub(s, 1, realpos1-1), 
    string.sub(s, realpos2, -1))
end

print(remove("hello world", 7, 4))
print(remove("hello world", 7, 99))
print(remove("hello world", -7, 4))
print(remove("hello world", 7, -4))
print(remove("hello world", 7, 0))

print(remove("ação", 2, 2))
