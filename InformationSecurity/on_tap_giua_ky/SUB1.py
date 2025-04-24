plaintext = input().strip('\n')
key = input().strip()

mapping = {chr(ord('a') + i): key[i] for i in range(26)}
ciphertext = []
for char in plaintext:
    if char == ' ':
        ciphertext.append(' ')
    else:
        ciphertext.append(mapping[char])

print(''.join(ciphertext))