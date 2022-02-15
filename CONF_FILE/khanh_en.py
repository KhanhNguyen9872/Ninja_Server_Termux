#!/data/data/com.termux/files/usr/bin/python
## KhanhNguyen9872
## Github: https://github.com/khanhnguyen9872
## FB: https://fb.me/khanh10a1

import base64

# Read file
f = open("~/../usr/share/KhanhNguyen9872/temp.txt", "r")
string=str(f.read())
f.close()

# Base64
string_encode = base64.b64encode(string.encode('utf-8',errors = 'strict')).decode("utf-8") 

# Binary
binary = ''.join(format(i, '08b') for i in bytearray(string_encode, encoding ='utf-8'))
binary = str(binary[::-1])

# a85
ascii85Str = base64.a85encode(binary.encode('utf-8')).decode('utf-8')
f1 = open("temp.txt", "w")
f1.write(ascii85Str)
f1.close()
