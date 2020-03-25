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
      		echo "Player"
   	else
      		echo "Computer"
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
		if [[ $win == 1 ]]
		then
			printf "Congratulation....!!!! $playerSymbol Is Won The Match.......huuuurrrrrryyyyyyyyyyy!!!!!@@@@@@!!!!!!"
		printBoard
	   	exit
		fi

		if [[ $n == 8 ]]
		then
			printBoard
			printf "This match is a Tie"
		exit
		fi
}

#Function For The Putting Position To Computer Side
function computerPlaying() 
{
	#Condition For Computer For The Block Oppnent
	if [[ ${Board[0,0]} == "$prevSymbol" && ${Board[0,1]} == "$prevSymbol" && ${Board[0,2]} == "2" ]]
    	then
      		Board[0,2]=$playerSymbol
		return
    	elif [[ ${Board[0,1]} == "$prevSymbol" && ${Board[0,2]} == "$prevSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
    	elif [[ ${Board[0,0]} == "$prevSymbol" && ${Board[0,2]} == "$prevSymbol" && ${Board[0,1]} == "1" ]]
   	then
      		Board[0,1]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[1,0]} == "$prevSymbol" && ${Board[1,1]} == "$prevSymbol" && ${Board[1,2]} == "5" ]]
    	then
      		Board[1,2]=$playerSymbol
		return
    	elif [[ ${Board[1,1]} == "$prevSymbol" && ${Board[1,2]} == "$prevSymbol" && ${Board[1,0]} == "3" ]]
    	then
      		Board[1,0]=$playerSymbol
		return
    	elif [[ ${Board[1,0]} == "$prevSymbol" && ${Board[1,2]} == "$prevSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[2,0]} == "$prevSymbol" && ${Board[2,1]} == "$prevSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
    	elif [[ ${Board[2,1]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[2,0]} == "6" ]]
    	then
      		Board[2,0]=$playerSymbol
		return
    	elif [[ ${Board[2,0]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[2,1]} == "7" ]]
    	then
      		Board[2,1]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[0,0]} == "$prevSymbol" && ${Board[1,0]} == "$prevSymbol" && ${Board[2,0]} == "6" ]]
    	then
      		Board[2,0]=$playerSymbol
		return
    	elif [[ ${Board[1,0]} == "$prevSymbol" && ${Board[2,0]} == "$prevSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
    	elif [[ ${Board[0,0]} == "$prevSymbol" && ${Board[2,0]} == "$prevSymbol" && ${Board[1,0]} == "3" ]]
    	then
      		Board[1,0]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[0,1]} == "$prevSymbol" && ${Board[1,1]} == "$prevSymbol" && ${Board[2,1]} == "7" ]]
    	then
      		Board[2,1]=$playerSymbol
		return
    	elif [[ ${Board[1,1]} == "$prevSymbol" && ${Board[2,1]} == "$prevSymbol" && ${Board[0,1]} == "1" ]]
    	then
      		Board[0,1]=$playerSymbol
		return
    	elif [[ ${Board[0,1]} == "$prevSymbol" && ${Board[2,1]} == "$prevSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[0,2]} == "$prevSymbol" && ${Board[1,2]} == "$prevSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
    	elif [[ ${Board[1,2]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[0,2]} == "2" ]]
    	then
      		Board[0,2]=$playerSymbol
		return
    	elif [[ ${Board[0,2]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[1,2]} == "5" ]]
    	then
      		Board[1,2]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[0,0]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
    	elif [[ ${Board[0,0]} == "$prevSymbol" && ${Board[1,1]} == "$prevSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
    	elif [[ ${Board[1,1]} == "$prevSymbol" && ${Board[2,2]} == "$prevSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
#----------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[2,0]} == "$prevSymbol" && ${Board[0,2]} == "$prevSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
	elif [[ ${Board[2,0]} == "$prevSymbol" && ${Board[1,1]} == "$prevSymbol" && ${Board[0,2]} == "2" ]]
    	then
      		Board[0,2]=$playerSymbol
		return
    	elif [[ ${Board[1,1]} == "$prevSymbol" && ${Board[0,2]} == "$prevSymbol" && ${Board[2,0]} == "6" ]]
    	then
      		Board[2,0]=$playerSymbol
		return
	#Condition For Computer Playing To The Winning
	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[0,1]} == "$playerSymbol" && ${Board[0,2]} == "2" ]]
    	then
      		Board[0,2]=$playerSymbol
		return
    	elif [[ ${Board[0,1]} == "$playerSymbol" && ${Board[0,2]} == "$playerSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
    	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[0,2]} == "$playerSymbol" && ${Board[0,1]} == "1" ]]
    	then
      		Board[0,1]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[1,0]} == "$playerSymbol" && ${Board[1,1]} == "$playerSymbol" && ${Board[1,2]} == "5" ]]
    	then
      		Board[1,2]=$playerSymbol
		return
    	elif [[ ${Board[1,1]} == "$playerSymbol" && ${Board[1,2]} == "$playerSymbol" && ${Board[1,0]} == "3" ]]
    	then
      		Board[1,0]=$playerSymbol
		return
    	elif [[ ${Board[1,0]} == "$playerSymbol" && ${Board[1,2]} == "$playerSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
    	elif [[ ${Board[2,0]} == "$playerSymbol" && ${Board[2,1]} == "$playerSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
    	elif [[ ${Board[2,1]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[2,0]} == "6" ]]
    	then
     		Board[2,0]=$playerSymbol
		return
    	elif [[ ${Board[2,0]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[2,1]} == "7" ]]
    	then
      		Board[2,1]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[1,0]} == "$playerSymbol" && ${Board[2,0]} == "6" ]]
    	then
      		Board[2,0]=$playerSymbol
		return
	elif [[ ${Board[1,0]} == "$playerSymbol" && ${Board[2,0]} == "$playerSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[2,0]} == "$playerSymbol" && ${Board[1,0]} == "3" ]]
    	then
      		Board[1,0]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
	elif [[ ${Board[0,1]} == "$playerSymbol" && ${Board[1,1]} == "$playerSymbol" && ${Board[2,1]} == "7" ]]
    	then
      		Board[2,1]=$playerSymbol
		return
	elif [[ ${Board[1,1]} == "$playerSymbol" && ${Board[2,1]} == "$playerSymbol" && ${Board[0,1]} == "1" ]]
    	then
      		Board[0,1]=$playerSymbol
		return
	elif [[ ${Board[0,1]} == "$playerSymbol" && ${Board[2,1]} == "$playerSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
	elif [[ ${Board[0,2]} == "$playerSymbol" && ${Board[1,2]} == "$playerSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
	elif [[ ${Board[1,2]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[0,2]} == "2" ]]
	then
      		Board[0,2]=$playerSymbol
		return
	elif [[ ${Board[0,2]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[1,2]} == "5" ]]
    	then
      		Board[1,2]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
	elif [[ ${Board[0,0]} == "$playerSymbol" && ${Board[1,1]} == "$playerSymbol" && ${Board[2,2]} == "8" ]]
    	then
      		Board[2,2]=$playerSymbol
		return
	elif [[ ${Board[1,1]} == "$playerSymbol" && ${Board[2,2]} == "$playerSymbol" && ${Board[0,0]} == "0" ]]
    	then
      		Board[0,0]=$playerSymbol
		return
#--------------------------------------------------------------------------------------------------------------
	elif [[ ${Board[2,0]} == "$playerSymbol" && ${Board[0,2]} == "$playerSymbol" && ${Board[1,1]} == "4" ]]
    	then
      		Board[1,1]=$playerSymbol
		return
	elif [[ ${Board[2,0]} == "$playerSymbol" && ${Board[1,1]} == "$playerSymbol" && ${Board[0,2]} == "2" ]]
    	then
      		Board[0,2]=$playerSymbol
		return
	elif [[ ${Board[1,1]} == "$playerSymbol" && ${Board[0,2]} == "$playerSymbol" && ${Board[2,0]} == "6" ]]
    	then
      		Board[2,0]=$playerSymbol
		return
fi
#--------------------------------------------------------------------------------------------------------------
#Condition For Corners Are Block
for ((i=0; i<row; i++))
do
	for ((j=0; j<column; j++))
	do
		if [[ ${Board[$i,$j]} == "0" || ${Board[$i,$j]} == "2" || ${Board[$i,$j]} == "6" || ${Board[$i,$j]} == "8" ]]
		then
			Board[$i,$j]=$playerSymbol
			return
		fi
	done
done

#---------------------------------------------------------------------------------------------------------------
k=0
if [[ $k == "0" ]]
then
	computerPosition=$((RANDOM%9))
	newRowIndex=$(($computerPosition / 3))
	newColumnIndex=$(($computerPosition % 3))
	if [[ ${Board[$newRowIndex,$newColumnIndex]} == "X" || ${Board[$newRowIndex,$newColumnIndex]} == "O" ]]
	then
		computerPlaying
	else
		Board[$newRowIndex,$newColumnIndex]=$playerSymbol
	fi
	k=1
fi
}

#Function For The Putting Position To User Side
function userPlaying() 
{
	read -p "Putting Your Position: " userPosition
	newRowIndex=$(($userPosition / 3))
	newColumnIndex=$(($userPosition % 3))
	Board[$newRowIndex,$newColumnIndex]=$playerSymbol
}

#Store toss Function In A New Variable
chance=$( toss )


#Function For Call The boardCreating
boardCreating

prevSymbol=X

#Function For The Position Assigning The Board
function playGame()
{
	if [[ $chance -eq "Player" ]]
	then
		p=0
		printf "Player will play first"
	else
		p=1
		printf "Computer will play first"
	fi

	#Call Function Print Board
	printBoard


	while [[ $n -lt 9 ]]
	do

		if [[ $(($p % 2)) -eq 0 ]]
		then
			#Store AssignSymbol Function In A New Variable
			playerSymbol=$( assignSymbol )
			#Call Function The User Play To The Game 
			userPlaying
		else
			playerSymbol=$( assignSymbol )
			#Call Function The System Play To The Game 
			computerPlaying
		fi

		printBoard

		#Call Function TicTacToe 
		ticTacToe
		((n++))
	((p++))
	done
}
playGame
