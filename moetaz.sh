#!/bin/bash
zenityresult=$(
zenity --checklist --list --title="test" --width="1000" --height="400" \
 --column="select" --column="names" \ " " "chercher tous les fichier executable" \ " " "supprimer tous lexecutable" \ " " "afficher les details  tous les fichier executable" \ " " "calculer le nombre de tous les fichiers et lexecutable" \
)
if [[ $zenityresult == "calculer le nombre de tous les fichiers et lexecutable" ]]; then

name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 

m=$(find  -type f -user  $name | wc -l) 

b=$(find -executable -type f -user $name | wc -l)
s="$(($m - $b))"
echo "le nombre des fichier executable = $b"
echo "le nombre de tous les fichiers = $m"
echo  "hedhi feha resultat ki natr7ouhom zouz bech t3wna fil pourcentage $s"
fi

if [[ $zenityresult == "chercher tous les fichier executable" ]]; then 
source ./config1.sh > file.txt
zenity --text-info  --text=cat < file.txt
fi

if [[ $zenityresult == "supprimer  tous les fichier executable" ]]; then 
name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 
find -executable -type f -user $name -exec rm
 zenity --info \
           --text "tous le ficher executable de lutilisateur $name est supprimer"
fi

if [[ $zenityresult == "afficher les details  tous les fichier executable" ]]; then 
name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 
find -executable -type f -user $name | ls -l > file.txt
zenity --text-info  --text=cat < file.txt
fi


