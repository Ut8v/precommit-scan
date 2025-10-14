#!/bin/bash

show_help() {
    echo "usage: $0 [-h] [-v]"
    echo " "
    echo "Options: "
    echo " -h Show this help message"
    echo " -v Verbose mode" 
}

VERBOSE=false 


while getopts ":hv" opt; do
   case ${opt} in 
     h ) show_help; exit 0 ;;
     v ) VERBOSE=true ;;
     \? ) echo "Invalid option"; show_help; exit 1 ;;
    esac
done

echo -e "Scanning staged files for API keys"


files=$(git diff --cached --name-only --diff-filter=ACM)

if [ -z "$files" ]; then 
   echo "No files staged"
   exit 0
fi

found=false

#Regex for api key
patterns=(
    "[A-Za-z0-9_]{20,}"
)

for file in $files; do 
  ["$VERBOSE" = true ] && echo " Checking $file"
   for pattern in "$pattern" "$file"; do
   if grep -Eq "$pattern" "$file"; then 
     echo -e "$ Possible secret detected in $file"
     echo "Pattern match : $patterns"
     found=true
    fi
   done
done

if [ "$found" = true ]; then 
   echo -e "Please remove sensitive data before commiting"
   exit 1
else 
  echo -e "No secrets found"
  exit 0
fi