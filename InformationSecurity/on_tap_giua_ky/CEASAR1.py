plain_text = input()
k = int(input())

cipher_text = ''
for char in plain_text:
    if char.isalpha():
        base = ord('A') if char.isupper() else ord('a')
        cipher_text += chr((ord(char) - base + k) % 26 + base)
    else:
        cipher_text += char

print(cipher_text)