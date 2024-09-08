-- return a string where "s2" is inserted into "s1" before position "pos"
-- strings may contain utf8 charecters and position is of the utf8 charecters
function insert(s1, pos, s2)
  local realpos = utf8.offset(s1, pos)
  if not realpos then
    return nil
  end
  return string.format("%s%s%s", 
    string.sub(s1, 1, realpos-1), 
    s2, 
    string.sub(s1, realpos, -1))
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", -12, "start: "))
print(insert("hello world", 7, "small "))
print(insert("hello world", 12, " goodbye"))
print(insert("hello world", 99, " goodbye"))

print(insert("ação", 5, "!"))
print(insert("ação", 3, "-"))
print(insert("ação", 8, "!"))
print(insert("ação", 5, "¿"))
print(insert("ação", 1, "¿"))
