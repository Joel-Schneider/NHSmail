#!/bin/bash

echo -en "Type your NHS.net username (the bit before @nhs.net): "
read USERNAME
echo -en "Type your password: "
read PASSWORD
echo -en "User: $USERNAME@nhs.net pass: $PASSWORD - press enter to continue. "
read JUNK

NEWFILE=`cat nhs.net.autologin.html.template`

# https://stackoverflow.com/questions/407523/escape-a-string-for-a-sed-replace-pattern#comment56782347_407523
TEMPO="${NEWFILE//"_USERNAME_"/"$USERNAME"}"
NEWFILE="${TEMPO//"_PASSWORD_"/"$PASSWORD"}"

echo $NEWFILE > nhs.net.autologin.html
echo