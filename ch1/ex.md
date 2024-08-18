# Exercise 1.2
```
lua -l lib -e "n = norm(3.4, 1.0); print(twice(n))"
```
```
lua -e 'dofile("lib.lua"); n = norm(3.4, 1.0); print(twice(n))'
```
# Exercise 1.3
HTML uses `<!-- a comment -->` as comments
# Exercise 1.4
```
___
_end
End
NULL
```
are valid identifiers
# Exercise 1.5
`type(nil)==nil` equals `false`, since the type of nil is a string and not nil
# Exercise 1.7
`and` has higher precedence over `or`, so the use of parantheses is not neccessary. however, it is recommended for readability
