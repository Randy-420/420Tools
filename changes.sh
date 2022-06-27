#!/bin/bash
changesFile="/var/mobile/tweaks/mine/repo/depic/changes/420Tools.html"
changesFind="<!--CHANGES-->"
changesVersionCodeOpen="<hr>\\n<p><b><center>Version:"
changesVersionCodeClose="</center></b></p>\\n"
changesCodeOpen="<p style=\"font-size:25px\"><center>"
changesCodeClose="</center></p>\\n"
changesBullet="•"

############################################
################DO#NOT#TOUCH################
############################################
Version=$1
changeLog=$(cat update.txt)
changeLog=$(echo "${changeLog//$'\n'/<br>• }")
changeLog=$(echo "$changeLog" | sed "s/^/• /g")

addChanges="$changesVersionCodeOpen $Version$changesVersionCodeClose$changesCodeOpen$changeLog$changesCodeClose"
if [[ $Version != "" ]]; then
#	sed "/$findAndReplace/ { c \\$replaceWith
#}" $file

	sed -i "/^$changesFind/a $addChanges" $changesFile

else
echo "fuuuuuuuuuuuuuuuuuck you"
fi