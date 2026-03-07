#!/bin/bash
sudo apt install bc || pkg install bc
echo -e  "\e[36;1;40m A Menu Based Calculator. \e[0m"
echo -e "\e[36;1;40m Below  operatation can be performed using operators.\n{1} Base64 Encoder\n{2} Base64 Decoder\n{3} Exit. \e[0m"
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
  exit
 ;;
 *)
  echo "Kindly choose the correct choice"
esac 

