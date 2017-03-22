#!/bin/bash


read -p "What is your first name?  " FIRST
read -p "And your last?  " LAST
read -p "Finally, what is your email?  " EMAIL

echo "Ok, stand by. Saving data to the server..."


function makeJSON ()
{
	cat <<EOF
	{
		"first_name": "$FIRST",
		"last_name": "$LAST",
		"email": "$EMAIL"
	}
EOF
}

curl \
--trace-ascii ascii_dump.txt \
-d "$(makeJSON)" \
-H "Content-Type: application/json" \
http://training-api-pgh.herokuapp.com/users

printf "\nData saved. Goodbye"
