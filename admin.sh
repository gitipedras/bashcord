echo -e "\e[32m[API]\e[0m https://discordapi.com"
echo -e "\e[32m[Session Host]\e[0m https://token.discordapi.com/?session.token=false"
echo -e "\e[32m[Variable Host]\e[0m https://var.discordapi.com/?variables.txt"

read -p "Username:" username
#read "Password:" password

#read -p "DISCORD (#:)> " com
#echo "1"

server=main
channel=general
deltext=+-+
username=Server_Admin


read -p "Server:[main]" server
if [[ $server = "" ]]; then
  server=main
  echo "[Server] https://servers.discordapi.com/main"
fi

echo "Create a channel (1) Select a channel (2)"
read -p "Option #>" chop

if [[ $chop = "1" ]]; then
  echo "Create a channel"
  read -p "Channel Name" chname
  touch channels/$chname.txt
  echo "Created channel $chname"
  channel=$chname
  echo "+-+ $channel +-+" >> channels/$channel.txt

elif [[ $chop = "2" ]]; then
  echo "/+/+/+/+/+/+/+/+/+/+/+/+/+/+/+/+/+/+/"

else
  echo "Error: no such option"

fi

read -p "Channel:[general]" channel

if [[ $channel = "" ]]; then
  channel=general
  echo "Main > General"
fi

com=1


case $com in
  1)
    while true; do

      echo "Use C^ to go to chat"
      watch -n 1 tail -n 10 channels/$channel.txt
      #tail -f general.txt


      #read -p "Press Enter" exit_view

      read -p "Message $channel #>" text1

      # Construct final message
      final_text="${username}:${text1}"

      # Append message to channel file
      echo "$final_text" >> channels/$channel.txt

    done
  ;;

  2)
    read "Message @${channel} #>" text1

    # Construct final message
    final_text="${username}(adm):${text1}"

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
