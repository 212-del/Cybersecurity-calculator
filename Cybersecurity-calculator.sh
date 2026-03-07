#!/bin/bash
sudo apt install bc || pkg install bc
echo -e  "\e[36;1;40m A Menu Based Calculator. \e[0m"
echo -e "\e[36;1;40m Below  operatation can be performed using operators.\n{1} Base64 Encoder\n{2} Base64 Decoder\n{3} Hash Identifier\n{4} Base32 Encoder\n{5} Base32 Decoder\n{6}{4} Exit. \e[0m"
until [[ $Choice1 =~ ^-?[0-9]+$ ]]; do
  read -r -p  "   Enter Choice: " Choice1
done
case ${Choice1} in
 1)
   read -r -p "Enter Text to encode : " Encode
   echo  "$Encode" | base64
 ;;
 2)
  read -r -p "Enter Text to decode : " Decode
  echo "$Decode" | base64 -d
 ;;
 3)
  read -r  -p "Enter Text to identify the hash-type : " hash
  length_one=$(echo -n "$hash" | wc -m)
  if [[ "$length_one" == "32"  ]]; then
   echo "The hash type is MD5"
  elif [[ "$length_one" == "40"  ]]; then
   echo "The hash type is SHA-1"
  elif [[ "$length_one" == "64"  ]]; then
   echo "The hash type is SHA-256"
  elif [[ "$length_one" == "128"  ]]; then
   echo "The hash type is SHA-512"
  elif [[ "$length_one" == "32" && "$length_one" == *:*  ]]; then
   echo "The hash type is NTLM"
  elif [[ "$length_one" == "60"  ]]; then
   echo "The hash type is bcrypt"
  elif [[ "$length_one" == "56"  ]]; then
   echo "The hash type is SHA-224"
  else
   echo "The hash type is could be Ceaser Cypher,bash64 encoded,Vigenère Cipher,XOR cypher,URL Encoding,ROT13,AES/DES Encoding,Hex Encoding,JWT tokens or custom encoding/obsfucation"
  fi
 ;;
 4)
  exit
 ;;
 *)
  echo "Kindly choose the correct choice"
esac 
