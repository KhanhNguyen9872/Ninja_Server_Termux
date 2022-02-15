#!/data/data/com.termux/files/usr/bin/python
## KhanhNguyen9872
## Github: https://github.com/khanhnguyen9872
## FB: https://fb.me/khanh10a1

import base64
import os

# Read file
locationfile=str(os.system('echo $restorefile'))
f = open(locationfile, "r")
string=str(f.read())
f.close()

# Decrypt a85
try:
    text = base64.a85decode(string).decode('utf-8')
    text = str(text[::-1])
    binary_int = int(text, 2)
    byte_number = binary_int.bit_length() + 7 // 8
    binary_array = binary_int.to_bytes(byte_number, "big")
    temp_decode = binary_array.decode()
    string_decode = base64.b64decode(str(temp_decode)).decode("utf-8")
    f1 = open("~/../usr/share/KhanhNguyen9872/temp.sql")
    f1.write(string_decode)
    f1.close()
    exit()
except:
    print("!!! ERROR FILE RESTORE !!!")
    exit()
