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


