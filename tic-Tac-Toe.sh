#!/bin/bash -x
#Tic Tac Toe Game:-
#As a Tic Tac Toe Player would like to challenge computer

echo "===================================================================="
echo "==============: WELCOME TO THE TIC-TAC-TOE GAME :=================="
echo "===================================================================="

#Variable
row=3
column=3

#Function For Printing The Gameboard 
function printBoard()
{
	for (( i=0; i<$row; i++ ))
	do
		echo "====================="
		echo "====================="
		for (( j=0; j<$column; j++))
		do
			printf "|| ${Board[$i,$j]} ||"
		done
		printf "\n"
	done
		echo "====================="
		echo "====================="
}

declare -A Board
#Function For Number Check Row And Column In Board
function  boardCreating() 
{
	local number=0
	for (( i=0; i<$row; i++ ))
	do
		for (( j=0; j<$column; j++ ))
		do
			Board[$i,$j]=$number
			((number++))
		done
	done
}

#Player Assigned To The Symbol X or Y
n=0
function assignSymbol() 
{
	if [[ $(($n%2)) -eq 0 ]]
	then
		echo "X"
	else
		echo "O"
	fi
}
#Function For Whoes Play First 
function toss() 
{
state=$((RANDOM%2))
   if [[ $state -eq 1 ]]
   then
      echo "First Is The Player"
   else
      echo "First Is The Computer"
   fi
}

#Function For Which Position Symbol Are Placed
function ticTacToe() 
{
	local win=0
		#Use The Condition Symbol ||X|| Printed That
		if [[ ${Board[0,0]} == "X" && ${Board[0,1]} == "X" && ${Board[0,2]} == "X" ]]
	   then
			win=1
		elif [[ ${Board[1,0]} == "X" && ${Board[1,1]} == "X" && ${Board[1,2]} == "X" ]] 
		then
	 		win=1
		elif [[ ${Board[2,0]} == "X" && ${Board[2,1]} == "X" && ${Board[2,2]} == "X" ]] 
		then
			win=1
		elif [[ ${Board[0,0]} == "X" && ${Board[1,0]} == "X" && ${Board[2,0]} == "X" ]] 
		then
			win=1
		elif [[ ${Board[0,1]} == "X" && ${Board[1,1]} == "X" && ${Board[2,1]} == "X" ]] 
		then
			win=1
		elif [[ ${Board[0,2]} == "X" && ${Board[1,2]} == "X" && ${Board[2,2]} == "X" ]] 
		then
			win=1
		elif [[ ${Board[0,0]} == "X" && ${Board[1,1]} == "X" && ${Board[2,2]} == "X" ]] 
		then
			win=1
		elif [[ ${Board[0,2]} == "X" && ${Board[1,1]} == "X" && ${Board[2,0]} == "X" ]] 
		then
			win=1
		fi
		#Use The Condition Symbol ||O|| Printed That
		if [[ ${Board[0,0]} == "O" && ${Board[0,1]} == "O" && ${Board[0,2]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[1,0]} == "O" && ${Board[1,1]} == "O" && ${Board[1,2]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[2,0]} == "O" && ${Board[2,1]} == "O" && ${Board[2,2]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[0,0]} == "O" && ${Board[1,0]} == "O" && ${Board[2,0]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[0,1]} == "O" && ${Board[1,1]} == "O" && ${Board[2,1]} == "O" ]] 
		then
      	win=1
   	elif [[ ${Board[0,2]} == "O" && ${Board[1,2]} == "O" && ${Board[2,2]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[0,0]} == "O" && ${Board[1,1]} == "O" && ${Board[2,2]} == "O" ]] 
		then
      	win=1
    	elif [[ ${Board[0,2]} == "O" && ${Board[1,1]} == "O" && ${Board[2,0]} == "O" ]] 
		then
      	win=1
   	fi
	#Use The Condition For Player Is Won Or Tie
	if [[ $won == 1 ]]
	then
		printf "Congratulation....!!!! $player Is Won The Match"
		printf "huuuurrrrrryyyyyyyyyyy!!!!!@@@@@@!!!!!! "
		displayBoard
	   	exit
	fi
	if [[ $n == 8 ]]
	then
		displayBoard
		printf "This match is a Tie"
		exit
	fi
}

#Store toss Function In A New Variable
chance=$( toss )
echo $chance

#Function For Call The boardCreating
boardCreating

#Function For The Position Assigning The Board
function playGame()
{
	while [[ $n -lt 9 ]]
	do
		#Store AssignSymbol Function In A New Variable
		player=$( assignSymbol )

		#Call Function Print Board
		printBoard

		read -p "Putting Your Position: " position

		#Check The Position Row And Column For A Player
		newRowIndex=$(($position / 3))
		newColumnIndex=$(($position % 3))
		Board[$newRowIndex,$newColumnIndex]=$player

		#Call Function TicTacToe 
		ticTacToe
		((n++))
	done
}
playGame
