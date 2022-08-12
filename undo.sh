#!/bin/bash
control="control"
controlFind="Version:"
controlVersion=0

makefile="Makefile"
makefileFind="PACKAGE_VERSION="
makefileVersion=0

f() { v=("${BASH_ARGV[@]}"); }

updateVersion(){
	file=$1
	shift 1
	findMe=$1

	oldVersion=$(sed -n "/^$findMe/p" $file)
	oldV=$(echo "$oldVersion" | sed -n "s/^$findMe//; s/ //p")
#echo "\"$oldV\""
	IFS="."
	read -r -a v <<< $oldV

	shopt -s extdebug
	f "${v[@]}"
	shopt -u extdebug

	index=0
#echo "${#v[@]}"
	if [[ ${#v[@]} == 1 || ${#v[@]} == 0 ]]; then
		return
	fi

	for i in ${v[@]}
	do
		if [ $i != $findMe ]; then
			if [[ $i -eq 0 ]]; then
				v[$index]=9
			else
				v[$index]=$((i-1))
				break
			fi
		fi

		index=$((index+1))
	done

	shopt -s extdebug
	f "${v[@]}"
	shopt -u extdebug

	index=1

	if [[ $file == $control ]]; then
		oldControlVersion=$oldV
	else
		oldMakefileVersion=$oldV
	fi

	for i in ${v[@]}; do
		index=$((index+1))
		if [[ $i == $findMe ]]; then
			continue
		fi
		if [[ $((index - 1)) -le 2 ]]; then
			newVersion="${findMe} ${i}"
			newV=${i}
		else
			newVersion="${newVersion}.${i}"
			newV="${newV}.${i}"
		fi
		if [[ $index -eq ${#v[@]} ]]; then
			break
		fi
	done

	if [[ $file == $control ]]; then
		controlVersion=$newV
	else
		makefileVersion=$newV
	fi
	sed -i "/$oldVersion/ { c \\$newVersion
}" $file

}

updateVersion $makefile $makefileFind
updateVersion $control $controlFind
#echo "makefile:\"$makefileVersion\""
#echo "control:\"$controlVersion\""
#exit 1

if ([[ $controlVersion == $makefileVersion ]] && [[ $oldControlVersion != $controlVersion ]] && [[ $oldMakefileVersion != $makefileVersion ]]) || ([[ $makefileVersion == 0 ]] && [[ $oldControlVersion != $controlVersion ]]); then
	echo -e "\n\n\e[1;32mVERSION INCREMENTATION SUCCESSFUL\e[0m\n\e[31m$oldControlVersion\e[0m => \e[1;34m$controlVersion\n\n\e[0m"
./depiction.sh "$controlVersion"
./changes.sh "$controlVersion"
else
	echo -e "\n\n\e[31mVERSION INCREMENTATION FAILED\e[0m
CONTROL: $controlVersion
MAKEFILE: $makefileVersion\n"
	return 1
fi