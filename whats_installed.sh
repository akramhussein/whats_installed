#!/usr/local/bin/bash
#
# Bash script to check what applications are installed on your machine.
# Requires Bash 4
#

# import package manager array
. pm_list.txt

# save as single list?
single_list=false

# runs command only if it's available
if_exists()
{
  if  command -v "$1" > /dev/null; then
    echo ">> Checking $1"
    if [ $single_list ]; then
      echo -e "\n$1\n===============\n" >> full_list.txt
      $1 $2 >> full_list.txt
    else
      $1 $2 > $1.txt
    fi
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
  if [ "$1" == "--full_list" ]; then
    single_list=true
  fi
  echo "Let's find out what junk is on your machine..."

  for i in "${!apps[@]}"
  do
    if_exists "$i" "${apps[$i]}"
  done
fi

echo "Done"
