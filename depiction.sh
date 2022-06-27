#!/bin/bash
Version=$1

depictionFile="/var/mobile/tweaks/mine/repo/depic/420Tools.html"
depictionFind="<!--Release-Version-->"
depictionCodeOpen="<p><b><center>Version: "
depictionCodeClose="</center></b></p>"

depictionBugFind="<!--BUGS-->"
depictionBugCodeOpen=""
depictionBugCodeClose=""

updateLines(){
	file=$1
	shift 1
	findMe=$1
	shift 1
	openCode=$1
	shift 1
	closeCode=$1
	shift 1
	insert=$1

	findAndReplace=$(sed -n "/^$findMe/p" $file)

replaceWith="$findMe$openCode$insert$closeCode"

#	sed "/$findAndReplace/ { c \\$replaceWith
#}" $file

	sed -i "s|$findAndReplace|$replaceWith|" $file
}

bugs=$(cat bugs.txt)
bugs=$(echo "${bugs//$'\n'/<br>• }")
bugs=$(echo "$bugs" | sed "s/^/• /g")

if [[ $Version != "" ]]; then
updateLines "$depictionFile" "$depictionFind" "$depictionCodeOpen" "$depictionCodeClose" "$Version"
#updateVersion $control $controlFind
else
echo "fuuuuuuuuuuuuuuuuuck you"
fi

if [[ $bugs != "" ]]; then
updateLines "$depictionFile" "$depictionBugFind" "$depictionBugCodeOpen" "$depictionBugCodeClose" "$bugs"
fi