#!/bin/sh

DIR="/home/$USER/.keysh"
RESULT=false

if [ "$1" ]; then
    ARG="$(echo "$1" | sed 's/.*/\L&/').txt"  # convierte a miniscula
    MATCH=$(find $PWD/docs -name $ARG)  # busqueda de archivo
    if [ "$MATCH" ] ; then
	cat "/home/$USER/.keysh/docs/$ARG"
    else
	echo "Your search '$1' didn't return any results :("
    fi

else
   for filename in $DIR/docs/*.txt; do
	cat $filename
	echo '\n'
    done
fi
