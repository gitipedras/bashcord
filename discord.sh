echo "Welcome to Discord!"


echo "Updating [discord]"
sleep 2
echo "Updating [discord]"
sleep 0.1
echo "Updating [discord]"
sleep 0.1
echo "Updating [discord]"
sleep 0.1

echo "[discord] Updated Successfully."

options=("Start Discord" "Run Admin" "Exit Discord")

PS3="Option>" # Prompt for user input

select opt in "${options[@]}"; do
  case $opt in
    "Start Discord")
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      echo "Starting [discord]"
      sleep 0.1
      ./main.sh
      # Add your code for Option 1 functionality here
      ;;
    "Run Admin")
      ./admin.sh
      # Add your code for Option 2 functionality here
      ;;
    "Exit Discord")
      exit
      # Add your code for Option 3 functionality here
      ;;
    *)
      echo "Invalid option."
      ;;
  esac
done
