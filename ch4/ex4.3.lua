-- return a string where "s2" is inserted into "s1" before position "pos"
function insert(s1, pos, s2)
  return string.format("%s%s%s", 
    string.sub(s1, 1, pos-1), 
    s2, 
    string.sub(s1, pos, -1))
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", -12, "start: "))
print(insert("hello world", 7, "small "))
print(insert("hello world", 12, " goodbye"))
print(insert("hello world", 99, " goodbye"))
