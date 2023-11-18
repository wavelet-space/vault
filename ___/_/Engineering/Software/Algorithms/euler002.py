a = 1
b = 1
soucet = 0

for i in range (4000000):
    soucet = a + b
    a = b
    b = soucet
    if soucet % 2 != 0:

print soucet

