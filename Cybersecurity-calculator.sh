#!/bin/bash
echo -e  "\e[36;1;40m A Menu Based Calculator. \e[0m"
echo -e "\e[36;1;40m Below  operatation can be performed using operators.\n{1} Base64 Encoder\n{2} Base64 Decoder\n{3} Hash Identifier\n{4} Base32 Encoder\n{5} Base32 Decoder\n{6} Base58 Encoder\n{7} Base58 Decoder\n{8} Base16 Encoder\n{9} Base16 Decoder\nOne-way Encryption\n{10} SHA-256 Encryption\n{11} SHA-1 Enryption\n{12} SHA-224 Encryption\n{13} SHA-384 Encryption\n{14} SHA-512 Encryption\n{15} MD5 Encryption\n{16} BLAKE2 Encryption\n{17} Exit. \e[0m"
until [[ $Choice1 =~ ^-?[0-9]+$ ]]; do
  read -r -p  "   Enter Choice: " Choice1
done
case ${Choice1} in
 1)
   read -r -p "Enter Text to encode : " Encode
   echo -n  "$Encode" | base64
 ;;
 2)
  read -r -p "Enter Text to decode : " Decode
  echo -n "$Decode" | base64 -d
 ;;
 3)
  read -r  -p "Enter Text to identify the hash-type : " hash
  length_one=$(echo -n -n "$hash" | wc -m)
  if [[ "$length_one" == "32"  ]]; then
   echo -n "The hash type is MD5"
  elif [[ "$length_one" == "40"  ]]; then
   echo -n "The hash type is SHA-1"
  elif [[ "$length_one" == "64"  ]]; then
   echo -n "The hash type is SHA-256"
  elif [[ "$length_one" == "128"  ]]; then
   echo -n "The hash type is SHA-512"
  elif [[ "$length_one" == "32" && "$length_one" == *:*  ]]; then
   echo -n "The hash type is NTLM"
  elif [[ "$length_one" == "60"  ]]; then
   echo -n "The hash type is bcrypt"
  elif [[ "$length_one" == "56"  ]]; then
   echo -n "The hash type is SHA-224"
  else
   echo -n "The hash type is could be Ceaser Cypher,bash64 encoded,Vigenère Cipher,XOR cypher,URL Encoding,ROT13,AES/DES Encoding,Hex Encoding,JWT tokens or custom encoding/obsfucation"
  fi
 ;;
 4)
  read -r -p " Enter Text to Encode : " encode
  echo -n "$encode" | base32
 ;;
 5)
  read -r -p " Enter Text to Decode : " encode
  echo -n "$encode" | base32 -d
 ;;
 6)
  read -r -p " Enter Text to Encode : " encode
  echo -n "$encode" | basenc --base58
 ;;
 7)
  read -r -p " Enter Text to Decode : " encode
  echo -n "$encode" | basenc --base58 -d
 ;;
 8)
  read -r -p " Enter Text to Encode : " encode
  echo -n "$encode" | basenc --base16
 ;;
 9)
  read -r -p " Enter Text to Decode : " encode
  echo -n "$encode" | basenc --base16 -d
 ;;
 10)
   read -r -p " Enter Text to Encrypt : " encode
   echo -n "$encode" | sha256sum
 ;;
 11)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha1sum
 ;;
 12)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha224sum
 ;;
 13)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha384sum
 ;;
 14)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha512sum
 ;;
 15)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | md5sum
 ;;
 16)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | b2sum
 ;;
 17)
  exit
 ;;
 *)
  echo  "Kindly choose the correct choice"
esac 
