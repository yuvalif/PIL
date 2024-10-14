# Exercise 5.1
```
t = {sunday = "monday"}
```
since `sunday` is a valid string, it can be used as an index to the table with the string value "monday".
```
sunday = "monday"; monday = "sunday"
t = {[sunday] = monday}
```
the variable `sunday` is evaluated inside the brackets to its value, which is the string "monday".
and the variable `monday` is evaluated to its value, which is the string "sunday".
so, the following code:
```
sunday = "monday"; monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
for k,v in pairs(t) do
    print(k,v)
end
```
has the following output:
```
sunday  monday
monday  sunday
```

# Exercise 5.2
```
a.a = a 
```
is equivalent to:
```
a["a"] = a
```
which means that the variable `a` of type table, has a single entry with the string index "a",
and the table that the variable `a` points to as its value.
so, the following code:
```
a = {} 
a.a = a
for k,v in pairs(a) do
    print(k,v)
end
print(a)
```
has the following output:
```
a       table: 0x5601825f1000
table: 0x5601825f1000
```
this means that:
`a` equals `a.a`, equals `a.a.a`, equals `a.a.a.a` etc.
we can look at:
```
a.a.a.a = 3
```
and rewrite it as:
```
b = a.a.a
b.a = 3
```
since `b` equals `a` it would be the same as:
```
a.a = 3
```
now `a` is a variable pointing to a table, with a single entry with the string index "a",
and `3` as the value. therefore `a.a.a.a` is the same as `3.a` which is not a valid expression.


