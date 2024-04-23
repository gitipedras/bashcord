echo -e "\e[32m[API]\e[0m https://discordapi.com"
echo -e "\e[32m[Session Host]\e[0m https://token.discordapi.com/?session.token=false"
echo -e "\e[32m[Variable Host]\e[0m https://var.discordapi.com/?variables.txt"
sleep 1
clear

notify-send "Welcome to Bashcord!" "Happy to see you!"

#trap cleanup SIGINT

#cleanup() {
#    sed -i "/$username/d" "appdata/online.txt"
#       echo "Closing session..."
#       sleep 1
#       exit
#}

echo "Type cc to create an account and terms to view terms of service"
echo "Press ENTER if quicksignin is installed and authenticated for this app"
read -p "Username:" username
if [[ $username = "ADMIN" ]]; then
	echo "[Log] You cannot login as the ADMIN"
	exit
elif [[ $username = "cc" ]]; then
 echo "Welcome to the universe of converstations on your console!"
 read -p "Create an account? [Y/n]" awn1
 	if [[ $awn1 = "y" ]]; then
 		echo "<< Create an account >>"
 		read -p "Username:" usrn
 		echo $usrn >> API/users.txt
 		read -p "Password:" usrpsd
 		usrpsdn=$($usrn$usrpsd)
 		echo $usrpsdn >> API/up.txt
 	elif [[ $awn1 = "Y" ]]; then
 		echo "<< Create an account >>"
 		read -p "Username:" usrn
 		echo $usrn >> API/users.txt
 		read -p "Password:" usrpsd
 		usrpsdn=$($usrn$usrpsd)
 		echo $usrpsdn >> API/up.txt
	else
 		exit
	fi
elif [[ $username = "terms" ]]; then
clear
echo "+++ Terms of Service ++"
elif [[ $username = "admin" ]]; then
	echo "[Log] You cannot login as the ADMIN"
	exit
elif [[ $username = "adm" ]]; then
	echo "[Log] You cannot login as the ADMIN"
	exit
elif [[ $username = "admn" ]]; then
	echo "[Log] You cannot login as the ADMIN"
	exit
elif [[ $username = *"admin"* ]]; then
	echo "[Log] You cannot login as the ADMIN"
	exit
elif [[ $username = *" "* ]]; then
	echo "[Log] Invalid Username "$username""
	exit
elif [ -e "quicksignin.key" ]; then
    echo " AUTHENTICATED WITH QUICKSIGNIN"
    username=po
else
	echo "[Log] Username is valid"
fi


echo "$username" >> appdata/online.txt
read -s -p "Password for $username:" password
if [ -e "quicksignin.key" ]; then
    echo " AUTHENTICATED WITH QUICKSIGNIN"
    password=panda    
fi
check_password() {
    local username="$1"
    local entered_password="$2"
    
    # Read the password associated with the username from the password file
    local correct_password=$(grep "^$username;" API/up.txt | cut -d ';' -f 2)
    
    # Check if the entered password matches the correct password
    if [ "$entered_password" = "$correct_password" ]; then
        echo "[Auth] Password is Correct"
    else
        echo "[Auth] Username($username) or Password is incorrect"
        exit
    fi
}

# Prompt the user for their username
# Prompt the user for their password (and hide input)
echo

# Check if the entered password is correct
check_password "$username" "$password"

server=main
channel=general
deltext=+-+

read -p "Channel:[general]" channel

if [[ $channel = "" ]]; then
  channel=general
  echo "Main > General"
fi

com=1


case $com in
  1)
    while true; do

      #echo "MESSAGE"
      watch -n 1 tail -n 10 channels/$channel.txt
      #tail -f general.txt


      #read -p "Press Enter" exit_view

      read -p "Message $channel #>" text1
      
      if [[ $text1 = "list" ]]; then
      	echo "Online Users:"
	cat appdata/online.txt
	sleep 2
	
      elif [[ $text1 = "qt" ]]; then
      
       sed -i "/$username/d" "appdata/online.txt"
       echo "Closing session..."
       sleep 1
       exit
       
      elif [[ $text1 = "quit" ]]; then
      
       sed -i "/$username/d" "appdata/online.txt"
       echo "Closing session..."
       sleep 1
       exit

      elif [[ $text1 = "chl" ]]; then
      
       channel_list=$(ls "channels")
       echo "$channel_list" > appdata/channel-list.txt
       cat appdata/channel-list.txt | sed 's/\.txt//g' > appdata/channel-tmp.txt
       cat appdata/channel-tmp.txt
      sleep 2
       
       elif [[ $text1 = "chm" ]]; then
      
       channel_list=$(ls "channels")
       echo "$channel_list" > appdata/channel-list.txt
       cat appdata/channel-list.txt | sed 's/\.txt//g' > appdata/channel-tmp.txt
       cat appdata/channel-tmp.txt
       read -p "Enter Channel:" channel
       
       elif [[ $text1 = "chdel" ]]; then
       
      
       channel_list=$(ls "channels")
       echo "$channel_list" > appdata/channel-list.txt
       cat appdata/channel-list.txt | sed 's/\.txt//g' > appdata/channel-tmp.txt
       cat appdata/channel-tmp.txt
       read -p "Enter channel to delete:" chdeltmp
       chdeltodelete="$chdeltmp.txt"
       
       mapfile -t protected_channels < appdata/protected-channels.txt

# Loop through the protected channels array
for protected_channel in "${protected_channels[@]}"; do
    # Check if $chdeltmp contains the protected channel
    if [[ "$chdeltmp" == *"$protected_channel"* ]]; then
        echo "You cannot delete this channel"
        exit 1
    else
    	channel=general
       rm channels/$chdeltodelete
    fi
done

	elif [[ $text1 = "admchdel" ]]; then
      
       channel_list=$(ls "channels")
       echo "$channel_list" > appdata/channel-list.txt
       cat appdata/channel-list.txt | sed 's/\.txt//g' > appdata/channel-tmp.txt
       cat appdata/channel-tmp.txt
       read -p "Enter channel to delete:" chdeltmp
       chdeltodelete="$chdeltmp.txt"
       rm channels/$chdeltodelete

       elif [[ $text1 = "chc" ]]; then
       	echo "$channel_list" > appdata/channel-list.txt
       	cat appdata/channel-list.txt | sed 's/\.txt//g' > appdata/channel-tmp.txt
       	cat appdata/channel-tmp.txt
       	read -p "Enter a name for your channel:" chctmp
      	chctocreate="$chctmp.txt"
       
       touch channels/$chctocreate
       
       read -p "Protect channel? [Y/n]" chcpt
       
      if [[ $chcpt = "y" ]]; then
       echo "Channel Protection Enabled"
       echo "$chctmp" > appdata/protected-channels.txt
       
      elif [[ $chcpt = "Y" ]]; then
      	echo "Channel Protection Enabled"
       
      else
       echo "Channel Protection Disabled"
       
      fi
      else
      final_text="${username}:${text1}"
      echo "$final_text" >> channels/$channel.txt
      notify-send "BASHCORD" "$text1"
      fi


    done
  ;;

  2)
    read "Message @${channel} #>" text1

    # Construct final message
    final_text="${username}:${text1}"

    # Append message to channel file
    echo "$final_text" >> "$channel.txt"
  ;;

  3)  # Exit
    echo "Goodbye!"
    exit 0;
    ;;

  4)
    echo "$deltext" > "general.txt"
    ;;

  *)  # Update Messages
  watch -n 1 tail -n 10 general.txt
    ;;
  esac
#done
