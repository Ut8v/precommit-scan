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

