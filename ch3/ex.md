# Exercise 3.1
```
.oe12           --> 0.0
0x12            --> 18
0xa             --> 10
0xFFFFFFFF      --> 4294967295
0x1P10          --> 1024.0
0.1e1           --> 1.0
0x0.1p1         --> 0.125
```
# Exercise 3.2
> TODO
# Exercise 3.3
```
-10     2
-9      0
-8      1
-7      2
-6      0
-5      1
-4      2
-3      0
-2      1
-1      2
0       0
1       1
2       2
3       0
4       1
5       2
6       0
7       1
8       2
9       0
10      1
```
Since the integer division is rounded down (not towards zero), the modulo values for the negative values
are different then the positive ones. 
E.g. `-10 // 3 = -4` and `-10 % 3 = 2`, because `3 * (-4) == -12` (rounded towards `-12` and not `-9`) and `-10 -(-12) = 2`.
# Exercise 3.4
Because exponent is right associative: `2^3^4 --> 2^(3^4) --> 2^81 --> 2.4178516392293e+24`
Because exponent take precedence over unary operator: `2^-3^4 --> 2^-(3^4) --> 2^(-81) --> 4.1359030627651e-25`
# Exercise 3.4
> TODO
