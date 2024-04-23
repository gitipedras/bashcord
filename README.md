# Bashcord - Discord in bash!

The project is a chat app, not accual discord.
But it works. No online features YET, but I will add them.

## Setup
1. Download the repo
2. Run `install.sh`
3. Run `main.sh`

## Notes
1. For login, edit API/up.txt
username-column;password-column
admin;rules

username: admin
password: ruler

2. Qicksignin works like this:

Change the variables under the if and else statements for the username and the password

Make sure to keep the `quicksignin.key` file wich is just for the app to know that you want to sign in quickly.
## Commands
For use in the chat
`chc` > Creates a channel
`chdel` > Deletes a channel
`admchdel` > Deletes protected channels
`qt`/`quit` > Exits the program
`chl` > Lists channels
`chm` > Changes channels
`list` > Lists online users

## Features
- Create and delete channels
- Make protected channels(ones that are only deletable with `admchdel`
- List online users

## Thank You!
## Feel free to clone or fork the repo and give it a star!
