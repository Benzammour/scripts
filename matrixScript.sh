#!/bin/bash

# author: Samir Benzammour

# migration of
# https://github.com/rdok/matrix-script/blob/master/enter_matrix.sh
# and
# https://gist.github.com/ttscoff/3729164/

### Original Authors:
# Author 1: rdok

# Author 2: Brett Terpstra 2012 <http://brettterpstra.com>
# Contributors to second half: Lauri Ranta and Carl <http://blog.carlsensei.com/>


GREEN='\033[1;32m'

clear

# find vertical center
vert_cent=$((`tput lines` / 2))
# find horizontel center
horzl_cent=$((`tput cols` / 2-10))

# change the foreground color of the terminal (cyan)
tput setf 6

# Position the cursor at row $vert_cent, colum horzl_cent and echo 
tput cup $vert_cent $horzl_cent && echo "${GREEN} entering the matrix"
# sleep for one second
sleep 1

tput cup $vert_cent $horzl_cent && echo "${GREEN}                    "
sleep 1
tput cup $vert_cent $horzl_cent && echo "${GREEN} entering the matrix"
sleep 1
tput cup $vert_cent $horzl_cent && echo "${GREEN}                    "
sleep 1

connect_mess="connecting"

# loop 13 times, and each .1 seconds add '.' to $connect_mess variable
for (( i=1; i<=13; i++ ))
do
	tput cup $vert_cent $horzl_cent && echo $connect_mess
	connect_mess="$connect_mess."
	sleep .1
done

# connected message
sleep 1
clear
tput cup $vert_cent $horzl_cent && echo "${GREEN}      CONNECTED     "
sleep 1
clear

### from now on script of Brett Terpstra 2012 <http://brettterpstra.com>
green="\033[0;32m"
brightgreen="\033[1;32m"

colors=($green $brightgreen)

spacing=${1:-5} # the likelihood of a character being left in place
scroll=${6:-8} # 0 for static, positive integer determines scroll speed
screenlines=$(expr `tput lines` - 1 + $scroll)
screencols=$(expr `tput cols` / 2 - 1)

# charset
chars=(ｱ ｲ ｳ ｴ ｵ ｶ ｷ ｸ ｹ ｺ ｻ ｼ ｽ ｾ ｿ ﾀ ﾁ ﾂ ﾃ ﾄ ﾅ ﾆ ﾇ ﾈ ﾉ ﾊ ﾋ ﾌ ﾍ ﾎ ﾏ ﾐ ﾑ ﾒ ﾓ ﾔ ﾕ ﾖ ﾗ ﾘ ﾙ ﾚ ﾛ ﾜ ﾝ a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 ^)

count=${#chars[@]}
colorcount=${#colors[@]}

trap "tput sgr0; clear; exit" SIGTERM SIGINT

if [[ $1 =~ '-h' ]]; then
	echo "Display a Matrix(ish) screen in the terminal"
	echo "Usage:		matrix [SPACING [SCROLL]]"
	echo "Example:	matrix 100 0"
	exit 0
fi

clear
tput cup 0 0
while :
	do for i in $(eval echo {1..$screenlines})
		do for i in $(eval echo {1..$screencols})
			do rand=$(($RANDOM%$spacing))
				case $rand in
					0)
						printf "${colors[$RANDOM%$colorcount]}${chars[$RANDOM%$count]} "
						;;
					1)
						printf "  "
						;;
					*)
						printf "\033[2C"
						;;
				esac
			done
			printf "\n"

			# sleep .005
		done
		tput cup 0 0
	done
