function isbool(x)
  return x == true or x == false
end

print(isbool(true))
print(isbool(false))
print(isbool(nil))
print(isbool(17))
print(isbool("hello"))
print(isbool({}))
print(isbool(isbool))

