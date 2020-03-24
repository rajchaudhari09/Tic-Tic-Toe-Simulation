#!/bin/bash -x
#Tic Tac Toe Game:-
#As a Tic Tac Toe Player would like to challenge computer

echo "===================================================================="
echo "==============: WELCOME TO THE SNACK LADDER GAME :=================="
echo "===================================================================="

function printBoard() {
	for (( i=0; i<3; i++ ))
	 do
		echo "====================="
		echo "====================="
		for (( j=0; j<3; j++))
		 do
			printf "||   ||"
		done
		printf "\n"
	 done
		echo "====================="
		echo "====================="
}
printBoard
