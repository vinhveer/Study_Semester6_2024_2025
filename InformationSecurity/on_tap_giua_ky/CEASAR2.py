ciper_text = input()
k = int(input())

plain_text = ''
for char in ciper_text:
    if char.isalpha():
        base = ord('A') if char.isupper() else ord('a')
        plain_text += chr((ord(char) - base - k) % 26 + base)
    else:
        plain_text += char

print(plain_text)