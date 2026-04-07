#!/bin/bash
echo -e  "\e[36;1;40m A Menu Based Calculator. \e[0m"
echo -e "\e[36;1;40m Below  operatation can be performed using operators.\n{1} Base64 Encoder and Decoder\n{2} Hash Identifier\n{3} Base32 Encoder and Decoder\n{4} Base58 Encoder and Decoder\n{5} Base16 Encoder and Decoder\nOne-way Encryption\n{6} SHA-256 Encryption\n{7} SHA-1 Enryption\n{8} SHA-224 Encryption\n{9} SHA-384 Encryption\n{10} SHA-512 Encryption\n{11} MD5 Encryption\n{12} BLAKE2 Encryption\n{13} ROT13 Encoder and Decoder\n{14} XOR Encoder and Decoder\n{15} URL Encoder and Decoder\n{16} HTML Encoder and Decoder\n{17} Binary Encoding and Decoding\n{18} UTF-8 Encoding and Decoding\n{19} UTF-16 Encoding and Decoding\n{20} UTF-32 Encoding and Decoding\n{21} Decimal Encoding and Decoding\n{22} Hexadecimal Encoding and Decoding\n{23} ASCII Encoding and Decoding\n{30} Exit. \e[0m"
until [[ $Choice1 =~ ^-?[0-9]+$ ]]; do
  read -r -p  "   Enter Choice: " Choice1
done
case ${Choice1} in
 1)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p "Enter Text to encode : " Encode
		encoded_text=$(echo -n "$Encode" | base64)
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p "Enter Text to decode : " Decode
		decoded_text=$(echo -n "$Decode" | base64 -d)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 2)
  read -r  -p "Enter Text to identify the hash-type : " hash
	length_one=$(echo -n "$hash" | wc -m)
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
 3)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		encoded_text=$(echo -n "$encode" | base32)
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " encode
		decoded_text=$(echo -n "$encode" | base32 -d)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 4)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		encoded_text=$(echo -n "$encode" | basenc --base58)
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " encode
		decoded_text=$(echo -n "$encode" | basenc --base58 -d)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 5)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		encoded_text=$(echo -n "$encode" | basenc --base16)
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " encode
		decoded_text=$(echo -n "$encode" | basenc --base16 -d)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 6)
   read -r -p " Enter Text to Encrypt : " encode
   echo -n "$encode" | sha256sum
 ;;
 7)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha1sum
 ;;
 8)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha224sum
 ;;
 9)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha384sum
 ;;
 10)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | sha512sum
 ;;
 11)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | md5sum
 ;;
 12)
  read -r -p " Enter Text to Encrypt : " encode
  echo -n "$encode" | b2sum
 ;;
 13)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		rot_result=$(echo "$encode" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
		echo "Encoded text: $rot_result"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter text to Decode : " encode
		rot_result=$(echo "$encode" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
		echo "Decoded text: $rot_result"
	else
		echo "Invalid mode"
	fi
 ;;
 14)
	read -r -p " Enter key : " key
	if [[ -z "$key" ]]; then
		echo "Key cannot be empty"
		exit 1
	fi

	read -r -p " Choose mode (e=encode, d=decode) : " xor_mode
	if [[ "$xor_mode" == "e" ]]; then
		read -r -p " Enter plain text : " plain_text
		cipher_hex=""
		for (( i=0; i<${#plain_text}; i++ )); do
			p_char="${plain_text:i:1}"
			k_char="${key:i%${#key}:1}"
			printf -v p_ord '%d' "'$p_char"
			printf -v k_ord '%d' "'$k_char"
			xor_ord=$((p_ord ^ k_ord))
			printf -v hex_byte '%02x' "$xor_ord"
			cipher_hex+="$hex_byte"
		done
		echo "Encoded text: $cipher_hex"
	elif [[ "$xor_mode" == "d" ]]; then
		read -r -p " Enter XOR hex text : " cipher_hex
		if [[ ! "$cipher_hex" =~ ^[0-9A-Fa-f]+$ ]] || (( ${#cipher_hex} % 2 != 0 )); then
			echo "Invalid hex input"
			exit 1
		fi

		plain_text=""
		idx=0
		for (( i=0; i<${#cipher_hex}; i+=2 )); do
			hex_byte="${cipher_hex:i:2}"
			byte_val=$((16#$hex_byte))
			k_char="${key:idx%${#key}:1}"
			printf -v k_ord '%d' "'$k_char"
			xor_ord=$((byte_val ^ k_ord))
			printf -v ch '\\x%02x' "$xor_ord"
			plain_text+="$ch"
			((idx++))
		done
		printf 'Decoded text: %b\n' "$plain_text"
	else
		echo "Invalid mode"
		exit 1
	fi
 ;;
 15)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter the URL to Encode : " encode
		encoded_text=$(echo "$encode" | sed \
			-e 's|%|%25|g' \
			-e 's| |%20|g' \
			-e 's|"|%22|g' \
			-e 's|<|%3C|g' \
			-e 's|>|%3E|g' \
			-e 's|\\|%5C|g' \
			-e 's|\^|%5E|g' \
			-e 's|`|%60|g' \
			-e 's|{|%7B|g' \
			-e 's|\||%7C|g' \
			-e 's|}|%7D|g')
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter the URL to Decode : " decode
		decoded_text=$(echo "$decode" | sed \
			-e 's|%20| |g' \
			-e 's|%22|"|g' \
			-e 's|%3C|<|g' \
			-e 's|%3E|>|g' \
			-e 's|%5C|\\|g' \
			-e 's|%5E|^|g' \
			-e 's|%60|`|g' \
			-e 's|%7B|{|g' \
			-e 's|%7C|\||g' \
			-e 's|%7D|}|g' \
			-e 's|%25|%|g')
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 16)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter the Text to Encode : " encode
		encoded_text=$(echo "$encode" | sed \
			-e 's|&|&amp;|g' \
			-e 's| |&nbsp;|g' \
			-e 's|"|&quot;|g' \
			-e "s|'|&#39;|g" \
			-e 's|<|&lt;|g' \
			-e 's|>|&gt;|g' \
			-e 's|¢|&cent;|g' \
			-e 's|£|&pound;|g' \
			-e 's|¥|&yen;|g' \
			-e 's|€|&euro;|g' \
			-e 's|©|&copy;|g' \
			-e 's|®|&reg;|g' \
			-e 's|§|&sect;|g' \
			-e 's|¶|&para;|g' \
			-e 's|±|&plusmn;|g' \
			-e 's|×|&times;|g' \
			-e 's|÷|&divide;|g' \
			-e 's|°|&deg;|g' \
			-e 's|µ|&micro;|g' \
			-e 's|·|&middot;|g' \
			-e 's|–|&ndash;|g' \
			-e 's|—|&mdash;|g' \
			-e 's|‘|&lsquo;|g' \
			-e 's|’|&rsquo;|g' \
			-e 's|“|&ldquo;|g' \
			-e 's|”|&rdquo;|g' \
			-e 's|•|&bull;|g' \
			-e 's|…|&hellip;|g' \
			-e 's|™|&trade;|g' \
			-e 's|←|&larr;|g' \
			-e 's|→|&rarr;|g' \
			-e 's|↑|&uarr;|g' \
			-e 's|↓|&darr;|g' \
			-e 's|↔|&harr;|g')
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter the Text to Decode : " encode
		decoded_text=$(echo "$encode" | sed \
			-e 's|&nbsp;| |g' \
			-e 's|&quot;|"|g' \
			-e "s|&#39;|'|g" \
			-e 's|&lt;|<|g' \
			-e 's|&gt;|>|g' \
			-e 's|&cent;|¢|g' \
			-e 's|&pound;|£|g' \
			-e 's|&yen;|¥|g' \
			-e 's|&euro;|€|g' \
			-e 's|&copy;|©|g' \
			-e 's|&reg;|®|g' \
			-e 's|&sect;|§|g' \
			-e 's|&para;|¶|g' \
			-e 's|&plusmn;|±|g' \
			-e 's|&times;|×|g' \
			-e 's|&divide;|÷|g' \
			-e 's|&deg;|°|g' \
			-e 's|&micro;|µ|g' \
			-e 's|&middot;|·|g' \
			-e 's|&ndash;|–|g' \
			-e 's|&mdash;|—|g' \
			-e 's|&lsquo;|‘|g' \
			-e 's|&rsquo;|’|g' \
			-e 's|&ldquo;|“|g' \
			-e 's|&rdquo;|”|g' \
			-e 's|&bull;|•|g' \
			-e 's|&hellip;|…|g' \
			-e 's|&trade;|™|g' \
			-e 's|&larr;|←|g' \
			-e 's|&rarr;|→|g' \
			-e 's|&uarr;|↑|g' \
			-e 's|&darr;|↓|g' \
			-e 's|&harr;|↔|g' \
			-e 's|&amp;|&|g')
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 17)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter text to encode in binary : " encode
		binary_output=""
		for (( i=0; i<${#encode}; i++ )); do
			ch="${encode:i:1}"
			printf -v ascii '%d' "'$ch"
			byte=""
			for (( bit=7; bit>=0; bit-- )); do
				byte+=$(( (ascii >> bit) & 1 ))
			done
			binary_output+="$byte "
		done
		echo "Encoded text: ${binary_output% }"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter binary text (example: 01001000 01101001) : " binary_input
		clean_binary="${binary_input// /}"
		if [[ ! "$clean_binary" =~ ^[01]+$ ]] || (( ${#clean_binary} % 8 != 0 )); then
			echo "Invalid binary input"
			exit 1
		fi

		decoded_text=""
		for (( i=0; i<${#clean_binary}; i+=8 )); do
			byte="${clean_binary:i:8}"
			value=$((2#$byte))
			printf -v ch '\\x%02x' "$value"
			decoded_text+="$ch"
		done
		printf 'Decoded text: %b\n' "$decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 18)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		utf_hex=$(echo -n "$encode" | iconv -f UTF-8 -t UTF-8 | xxd -p -c 256)
		echo "Encoded text: $utf_hex"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		clean_hex="${decode// /}"
		if [[ ! "$clean_hex" =~ ^[0-9A-Fa-f]+$ ]] || (( ${#clean_hex} % 2 != 0 )); then
			echo "Invalid hex input"
			exit 1
		fi
		decoded_text=$(echo -n "$clean_hex" | xxd -r -p | iconv -f UTF-8 -t UTF-8)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 19)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		utf_hex=$(echo -n "$encode" | iconv -f UTF-8 -t UTF-16LE | xxd -p -c 256)
		echo "Encoded text: $utf_hex"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		clean_hex="${decode// /}"
		if [[ ! "$clean_hex" =~ ^[0-9A-Fa-f]+$ ]] || (( ${#clean_hex} % 2 != 0 )); then
			echo "Invalid hex input"
			exit 1
		fi
		decoded_text=$(echo -n "$clean_hex" | xxd -r -p | iconv -f UTF-16LE -t UTF-8)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 20)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		utf_hex=$(echo -n "$encode" | iconv -f UTF-8 -t UTF-32LE | xxd -p -c 256)
		echo "Encoded text: $utf_hex"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		clean_hex="${decode// /}"
		if [[ ! "$clean_hex" =~ ^[0-9A-Fa-f]+$ ]] || (( ${#clean_hex} % 2 != 0 )); then
			echo "Invalid hex input"
			exit 1
		fi
		decoded_text=$(echo -n "$clean_hex" | xxd -r -p | iconv -f UTF-32LE -t UTF-8)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 21)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		decimal_output=""
		for (( i=0; i<${#encode}; i++ )); do
			ch="${encode:i:1}"
			printf -v ord '%d' "'$ch"
			decimal_output+="$ord "
		done
		echo "Encoded text: ${decimal_output% }"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		decoded_text=""
		read -r -a numbers <<< "$decode"
		for n in "${numbers[@]}"; do
			if [[ ! "$n" =~ ^[0-9]+$ ]] || (( n < 0 || n > 255 )); then
				echo "Invalid decimal input"
				exit 1
			fi
			printf -v ch '\\x%02x' "$n"
			decoded_text+="$ch"
		done
		printf 'Decoded text: %b\n' "$decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 22)
 #Hexadecimal is just a base-16 representation
 #So at 5th choice we have base16 encoding and decoding which is same as hexadecimal encoding and decoding
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		encoded_text=$(echo -n "$encode" | xxd -p -c 256)
		echo "Encoded text: $encoded_text"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		clean_hex="${decode// /}"
		if [[ ! "$clean_hex" =~ ^[0-9A-Fa-f]+$ ]] || (( ${#clean_hex} % 2 != 0 )); then
			echo "Invalid hex input"
			exit 1
		fi
		decoded_text=$(echo -n "$clean_hex" | xxd -r -p)
		echo "Decoded text: $decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 23)
	read -r -p " Choose mode (e=encode, d=decode) : " mode
	if [[ "$mode" == "e" ]]; then
		read -r -p " Enter Text to Encode : " encode
		ascii_output=""
		for (( i=0; i<${#encode}; i++ )); do
			ch="${encode:i:1}"
			printf -v ord '%d' "'$ch"
			ascii_output+="$ord "
		done
		echo "Encoded text: ${ascii_output% }"
	elif [[ "$mode" == "d" ]]; then
		read -r -p " Enter Text to Decode : " decode
		decoded_text=""
		read -r -a numbers <<< "$decode"
		for n in "${numbers[@]}"; do
			if [[ ! "$n" =~ ^[0-9]+$ ]] || (( n < 0 || n > 127 )); then
				echo "Invalid ASCII input"
				exit 1
			fi
			printf -v ch '\\x%02x' "$n"
			decoded_text+="$ch"
		done
		printf 'Decoded text: %b\n' "$decoded_text"
	else
		echo "Invalid mode"
	fi
 ;;
 24
	 declare -A MORSE

	MORSE[A]=".-"
	MORSE[B]="-..."
	MORSE[C]="-.-."
	MORSE[D]="-.."
	MORSE[E]="."
	MORSE[F]="..-."
	MORSE[G]="--."
	MORSE[H]="...."
	MORSE[I]=".."
	MORSE[J]=".---"
	MORSE[K]="-.-"
	MORSE[L]=".-.."
	MORSE[M]="--"
	MORSE[N]="-."
	MORSE[O]="---"
	MORSE[P]=".--."
	MORSE[Q]="--.-"
	MORSE[R]=".-."
	MORSE[S]="..."
	MORSE[T]="-"
	MORSE[U]="..-"
	MORSE[V]="...-"
	MORSE[W]=".--"
	MORSE[X]="-..-"
	MORSE[Y]="-.--"
	MORSE[Z]="--.."

	MORSE[0]="-----"
	MORSE[1]=".----"
	MORSE[2]="..---"
	MORSE[3]="...--"
	MORSE[4]="....-"
	MORSE[5]="....."
	MORSE[6]="-...."
	MORSE[7]="--..."
	MORSE[8]="---.."
	MORSE[9]="----."
         read -r -p " Choose mode (e=encode, d=decode) : " mode
         if [[ "$mode" == "e" ]]; then
                 read -r -p " Enter Text to Encode : " encode
		  encode=$(echo "$input" | tr '[:lower:]' '[:upper:]')
		  output=""
		  for (( i=0; i<${#encode}; i++ )); do
		    char="${input:$i:1}"

		    if [[ "$char" == " " ]]; then
		        # Word separator
		        output+="/ "
		    elif [[ -n "${MORSE[$char]}" ]]; then
		        # Letter conversion
		        output+="${MORSE[$char]} "
		    else
		        # Ignore unknown characters
		        output+="? "
		    fi
		done
		 echo -n "Morse Code: "$output
         elif [[ "$mode" == "d" ]]; then
                 read -r -p " Enter Text to Decode : " decode
		 declare -A MORSE

		MORSE[".-"]="A"
		MORSE["-..."]="B"
		MORSE["-.-."]="C"
		MORSE["-.."]="D"
		MORSE["."]="E"
		MORSE["..-."]="F"
		MORSE["--."]="G"
		MORSE["...."]="H"
		MORSE[".."]="I"
		MORSE[".---"]="J"
		MORSE["-.-"]="K"
		MORSE[".-.."]="L"
		MORSE["--"]="M"
		MORSE["-."]="N"
		MORSE["---"]="O"
		MORSE[".--."]="P"
		MORSE["--.-"]="Q"
		MORSE[".-."]="R"
		MORSE["..."]="S"
		MORSE["-"]="T"
		MORSE["..-"]="U"
		MORSE["...-"]="V"
		MORSE[".--"]="W"
		MORSE["-..-"]="X"
		MORSE["-.--"]="Y"
		MORSE["--.."]="Z"

		MORSE["-----"]="0"
		MORSE[".----"]="1"
		MORSE["..---"]="2"
		MORSE["...--"]="3"
		MORSE["....-"]="4"
		MORSE["....."]="5"
		MORSE["-...."]="6"
		MORSE["--..."]="7"
		MORSE["---.."]="8"
		MORSE["----."]="9"
  		 output=""
		 for token in $input; do
		    if [[ "$token" == "/" ]]; then
		        # Word separator
		        output+=" "
		    elif [[ -n "${MORSE[$token]}" ]]; then
		        # Decode symbol
		        output+="${MORSE[$token]}"
		    else
		        # Unknown pattern
		        output+="?"
		    fi
		done
		  echo -n "Decoded Text:"$output
	 else
		 echo "Invalid mode"
	 fi
 ;;
 30)
  exit
 ;;
 *)
  echo  "Kindly choose the correct choice"
esac 
