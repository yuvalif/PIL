-- reverse utf8
function utf8reverse(s)
  local r = ""
  len = utf8.len(s)
  for i = 1, len do
    c = utf8.char(utf8.codepoint(s, utf8.offset(s, i)))
    r = c..r
  end
  return r
end

-- check if string is a palindrome
function ispali(s, ignores)
  if ignores then
    for _, i in pairs(ignores) do
      local new_s, hits = string.gsub(s, i, "")
      if hits > 0 then
        s = new_s
      end
    end
  end
  return utf8reverse(s) == s
end

-- ex4.7
print("check if a string is a palindrome")
print(ispali("banana"))
print(ispali("step on no pets"))
print(ispali("step on no pets!"))
print(ispali("a b c b a"))
print(ispali("a, b, c, b, a"))
print(ispali("abba"))
print(ispali("ab.ba"))
print(ispali("abba "))
print(ispali("    ."))

print(ispali("ação"))
print(ispali("açãoãça"))
print(ispali("¿açãoãça"))
print(ispali("ação ãça."))

-- ex4.8
local ignores = {"!", "?", "¿", ":", ";", "-", "%.", ",", " ", "\t", "\n"}
print("check if a string is a palindrome, ignoring non-alphanum characters")
print(ispali("banana", ignores))
print(ispali("step on no pets", ignores))
print(ispali("step on no pets!", ignores))
print(ispali("a b c b a", ignores))
print(ispali("a, b, c, b, a", ignores))
print(ispali("abba", ignores))
print(ispali("ab.ba", ignores))
print(ispali("abba ", ignores))
print(ispali("    .", ignores))

print(ispali("ação", ignores))
print(ispali("açãoãça", ignores))
print(ispali("¿açãoãça", ignores))
print(ispali("ação ãça.", ignores))
