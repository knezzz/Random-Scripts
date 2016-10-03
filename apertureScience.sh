#!/bin/bash
COLUMNS=$(tput cols)

printf "[\e[1;38;5;46m   OK   \e[0m]"
printf "\e[0m System status...\n"
#printf "%*s" $((($COLUMNS-19)))


#printf "[ \e[1;38;5;27m\e[0m]"
#printf "\e[0m Her name is...\n"
#printf "%*s" $((($COLUMNS-26)))

printf "[\e[1;38;5;46m   OK   \e[0m]"
printf "\e[0m GLaDOS AI...\n"

printf "[\e[1;38;5;196m IS LIE \e[0m]"
printf "\e[0m Cake...\n"

printf "\e[38;5;255m"

circle_logo1='              .,-:;//;:=,                 '
circle_logo2='          . :H@@@MM@M#H/.,+%;,            '
circle_logo3='       ,/X+ +M@@M@MM%=,-%HMMM@X/,         '
circle_logo4='     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-       '
circle_logo5='    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.     '
circle_logo6='  ,%MM@@MH ,@%=             .---=-=:=,.   '
circle_logo7='  =@#@@@MX.,                -%HX$$%%%:;   '
circle_logo8=' =-./@M@M$                   .;@MMMM@MM:  '
circle_logo9=' X@/ -$MM/                    . +MM@@@M$  '
circle_logo10=',@M@H: :@:                    . =X#@@@@- '
circle_logo11=',@@@MMX, .                    /H- ;@M@M= '
circle_logo12='.H@@@@M@+,                    %MM+..%#$. '
circle_logo13=' /MMMM@MMH/.                  XM@MH; =;  '
circle_logo14='  /%+%$XHH@$=              , .H@@@@MX,   '
circle_logo15='   .=--------.           -%H.,@@@@@MX,   '
circle_logo16='   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.    '
circle_logo17='     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=      '
circle_logo18='       =%@M@M#@$-.=$@MM@@@M; %M%=        '
circle_logo19='         ,:+$+-,/H#MMMMMMM@= =,          '
circle_logo20='               =++%%%%+/:-.              '


printf "\n\n"

printf "%*s\n" $(((${#circle_logo1}+$COLUMNS)/2)) "$circle_logo1"
printf "%*s\n" $(((${#circle_logo2}+$COLUMNS)/2)) "$circle_logo2"
printf "%*s\n" $(((${#circle_logo3}+$COLUMNS)/2)) "$circle_logo3"
printf "%*s\n" $(((${#circle_logo4}+$COLUMNS)/2)) "$circle_logo4"
printf "%*s\n" $(((${#circle_logo5}+$COLUMNS)/2)) "$circle_logo5"
printf "%*s\n" $(((${#circle_logo6}+$COLUMNS)/2)) "$circle_logo6"
printf "%*s\n" $(((${#circle_logo7}+$COLUMNS)/2)) "$circle_logo7"
printf "%*s\n" $(((${#circle_logo8}+$COLUMNS)/2)) "$circle_logo8"
printf "%*s\n" $(((${#circle_logo9}+$COLUMNS)/2)) "$circle_logo9"
printf "%*s\n" $(((${#circle_logo10}+$COLUMNS)/2)) "$circle_logo10"
printf "%*s\n" $(((${#circle_logo11}+$COLUMNS)/2)) "$circle_logo11"
printf "%*s\n" $(((${#circle_logo12}+$COLUMNS)/2)) "$circle_logo12"
printf "%*s\n" $(((${#circle_logo13}+$COLUMNS)/2)) "$circle_logo13"
printf "%*s\n" $(((${#circle_logo14}+$COLUMNS)/2)) "$circle_logo14"
printf "%*s\n" $(((${#circle_logo15}+$COLUMNS)/2)) "$circle_logo15"
printf "%*s\n" $(((${#circle_logo16}+$COLUMNS)/2)) "$circle_logo16"
printf "%*s\n" $(((${#circle_logo17}+$COLUMNS)/2)) "$circle_logo17"
printf "%*s\n" $(((${#circle_logo18}+$COLUMNS)/2)) "$circle_logo18"
printf "%*s\n" $(((${#circle_logo19}+$COLUMNS)/2)) "$circle_logo19"
printf "%*s\n" $(((${#circle_logo20}+$COLUMNS)/2)) "$circle_logo20"

printf "\n\n"
printf "\e[39m\e[1;38;5;255m"

as_logo1="   _                 _                  ___     _                 "
as_logo2="  /_\  _ __  ___ _ _| |_ _  _ _ _ ___  / __| __(_)___ _ _  __ ___ "
as_logo3=" / _ \| '_ \/ -_) '_|  _| || | '_/ -_) \__ \/ _| / -_) ' \/ _/ -_)"
as_logo4="/_/ \_\ .__/\___|_|  \__|\_,_|_| \___| |___/\__|_\___|_||_\__\___|"
as_logo5="      |_|                                                         "

printf "%*s\n" $(((${#as_logo1}+$COLUMNS)/2)) "$as_logo1"
printf "%*s\n" $(((${#as_logo2}+$COLUMNS)/2)) "$as_logo2"
printf "%*s\n" $(((${#as_logo3}+$COLUMNS)/2)) "$as_logo3"
printf "%*s\n" $(((${#as_logo4}+$COLUMNS)/2)) "$as_logo4"
printf "%*s\n" $(((${#as_logo5}+$COLUMNS)/2)) "$as_logo5"
title="Secure Terminal Login"
printf "%*s\n\n" $(((${#title}+$COLUMNS)/2)) "$title"

printf -v line '\e[0m%*s' "$COLUMNS"; echo ${line// /-}

printf "\e[0;38;5;196m\n"
warning1="Use of this terminal is covered under the Aperture Laboratories Employee"
warning2="and Company Securiy Act. Unauthorized use of this terminal will result in action"
warning3="as detailed under Article 14, Paragraph 5, Section U of the aforementioned act."
warning4="Thank you or helping us help you help us all."

printf "%*s\n" $(((${#warning1}+$COLUMNS)/2)) "$warning1"
printf "%*s\n" $(((${#warning2}+$COLUMNS)/2)) "$warning2"
printf "%*s\n\n" $(((${#warning3}+$COLUMNS)/2)) "$warning3"
printf "%*s\n" $(((${#warning4}+$COLUMNS)/2)) "$warning4"
#Check how to add image
#osascript -e 'display notification "GLaDOS was here!" with title "GLaDOS"'
