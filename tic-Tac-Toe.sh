#!/bin/bash -x
#Tic Tac Toe Game:-
#As a Tic Tac Toe Player would like to challenge computer

echo "===================================================================="
echo "==============: WELCOME TO THE TIC-TAC-TOE GAME :=================="
echo "===================================================================="

#Function For Printing The Gameboard 
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

#Player Assigned To The Symbol X or Y
function assignSymbol()
{
 state=$((RANDOM%2))
	if (( $state == 1 ))
	 then
		echo "X"
	 else
		echo "O"
	fi
}
player=$( assignSymbol )
echo $player

