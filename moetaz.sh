#!/bin/bash
zenityresult=$(
zenity --checklist --list --title="test" --width="1000" --height="400" \
 --column="select" --column="names" \ " " "chercher tous les fichier executable" \ " " "supprimer tous lexecutable" \ " " "afficher les details  tous les fichier executable" \ " " "calculer le nombre de tous les fichiers et lexecutable" \ " " "save"\
)
if [[ $zenityresult == "calculer le nombre de tous les fichiers et lexecutable" ]]; then

name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 

m=$(find /root  -type f -user  $name | wc -l) 

b=$(find /root -executable -user $name | wc -l)
s=$(((($b / $m))*100))
zenity --info \
           --text "$m,$b,$s%"
./moetaz.sh
fi

if [[ $zenityresult == "chercher tous les fichier executable" ]]; then 
source ./config1.sh > file.txt
zenity --text-info  --text=cat < file.txt
./moetaz.sh
fi

if [[ $zenityresult == "supprimer  tous les fichier executable" ]]; then 
name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 
find  -executable -type f -user $name -exec rm
rm -r $(find  -executable -type f -user $name)
 zenity --info \
           --text "tous le ficher executable de lutilisateur $name est supprimer"
./moetaz.sh
fi

if [[ $zenityresult == "afficher les details  tous les fichier executable" ]]; then 
name=$( zenity --entry --title "ARGUMENT"  --text "Please enter your name:") 
find /root -executable -type f -user $name | ls -l > file.txt 
zenity --text-info  --text =cat < file.txt
./moetaz.sh
fi

if [[ $zenityresult == "save" ]]; then 

date > sauvegarde.txt
$s > sauvegarde.txt
zenity --calendar
 
fi

