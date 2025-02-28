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

# Hợp của hai tập hợp a và b
c = []

for i in range(n):
    if a[i] not in c:
        c.append(a[i])
    if b[i] not in c:
        c.append(b[i])

print("Hợp của hai tập hợp a và b: ", c)