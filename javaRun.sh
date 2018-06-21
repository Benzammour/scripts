echo "Algorithmus $1"
echo "Länge: $2"

> aufg.tex
> loes.tex

sleep 0.5

java -jar DSALExercisesStudent.jar -a $1 -e aufg.tex -t loes.tex -l $2

sleep 0.5

pdflatex aufg.tex
pdflatex loes.tex

sleep 0.5

rm -rf *.log
rm -rf *.aux
#rm -rf *.tex

clear

# find vertical center
vert_cent=$((`tput lines` / 2))

# find horizontel center
horzl_cent=$((`tput cols` / 2-10))

clear
tput cup $vert_cent $horzl_cent && echo "      ### DONE ####     "

sleep 0.5

clear
