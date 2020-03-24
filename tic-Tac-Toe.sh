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

#Store AssignSymbol Function In A New Variable
playerSymbol=$( assignSymbol )

#Function For Whoes Play First 
function toss() {
state=$((RANDOM%2))
   if [[ $state -eq 1 ]]
    then
      echo "First Chance Of Player"
    else
      echo "First Chance Of Computer"
   fi
}

chance=$( toss )
echo $chance
#Calling The Lastly Print Board Function Because The Player Of Play On Gameboard
printBoard
