'''
 Name: Rie Durnil
 Class: CPSC 353
 Date Submitted: January 28, 2021
 Assignment: Project 1                                                                     
 Description: This program encrypts and decrypts a plaintext message utilizing
  a transposition cipher, permuting the alphabet to create the keys. 
 Notes: I used the textbook by McAndrew as well as code written by Dr. De Palma.
'''

'''
Generates and returns the key used in the transposition cipher.
This will include a random permutation of the alphabet.
'''
def key_gen():
  #Generate the alphabet
  lst = [chr(i) for i in range( ord('A'), (ord('Z') +1) ) ]

  #Permute the list using a Sage function
  lstP = Permutations(lst).random_element()

  #return the permuted array
  return lstP

'''
Returns the encryption of string, plain_txt,  using a permuted alphabet
which is part of key and the transposition cipher.
'''
def encrypt(plain_txt, key):
  cipher_text = ""
  #go through each letter of the plaintext and encrypt it
  for x in plain_txt:
      y = key[ord(x)-65]
      cipher_text = cipher_text + y
  #return the encrypted message
  return cipher_text

'''
Returns the decryption of string, cipher_txt,
using a permuted alphabet which is part of key and the transposition
cipher. 
'''
def decrypt(cipher_txt, key):
  #create another ordered array
  lst = [chr(i) for i in range( ord('A'), (ord('Z') +1) ) ]
  
  #go through permuted key and sort it, taking ordered array along with it
  for l in range(len(key)):
      min = l
      for j in range(l+1, len(key)):
          if key[j] < key[min]:
              min = j
      c = key[min]
      print(c)
      key[min] = key[l]
      key[l] = c
      c = lst[min]
      lst[min] = lst[l]
      lst[l] = c
  
  #go through ciphertext, letter by letter, to decrypt
  plain_text = ""
  for x in cipher_txt:
      y = lst[ord(x)-65]
      plain_text = plain_text + y
      
  #return decrypted message
  return plain_text

#running program
enc_key = key_gen()
dec_key = enc_key
PT = "IAMNOBODYWHOAREYOU"
CT = encrypt(PT, enc_key)
print(CT)
PT = decrypt(CT, dec_key)
print(PT)
