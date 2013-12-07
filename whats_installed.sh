#!/usr/local/bin/bash
#
# Bash script to check what applications are installed on your machine.
# Requires Bash 4
#

# associative array to hold application and command to list installed packages
# apps[application]=command
declare -A apps

# packages and list commands
apps[brew]=list
apps[pip]=freeze
apps[npm]=list
apps[ports]=installed

# runs command only if it's available
if_exists()
{
  if  command -v "$1" > /dev/null; then
    echo ">> Checking $1"
    $1 $2 > $1.txt
  fi
}

# removes .txt file for app
clean_up()
{
  if command -v "$1" > /dev/null; then
    rm -rf $1.txt
  fi
}

# should we remove the .txt files or generate them?
if [ "$1" == "--cleanup" ]; then
  echo "Cleaning up..."
  for i in "${!apps[@]}"
  do
    clean_up "$i"
  done
else
  echo "Let's find out what junk is on your machine..."

  for i in "${!apps[@]}"
  do
    if_exists "$i" "${apps[$i]}"
  done
fi

echo "Done"
