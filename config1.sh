#!/bin/bash

name=$( zenity --entry --title "ARGUMENT" --text "Please enter your name:") 

 command= find -executable -type f -user $name
$command

