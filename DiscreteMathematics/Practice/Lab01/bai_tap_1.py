a = []
b = []

n = int(input())
for i in range(n):
    x = int(input())
    a.append(x)

m = int(input())
for i in range(m):
    x = int(input())
    b.append(x)

# Giao của hai tập hợp a và b
for i in range(n):
    if a[i] in b:
        print(a[i], end = " ")