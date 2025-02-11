a = [1, 3, 5]
b = [3, 1, 4, 6, 5]

count = 0

for i in a:
    for i in b:
        count += 1;

if count == len(a):
    print("A là con của b")
else:
    print("A không là con của b")