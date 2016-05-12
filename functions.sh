#reach command

reach() {

	if [[ $(vfy_par $# 2 "reach <file> [ <another_file> ... <last_file>  ] <destination>") -eq -1 ]]; then
		return -1
	fi

	to=${@##* }
	files=${@% *}

	for file in $files; do
		mv_safe $file $to
	done

	cd $to
}

#take command. Creates a new directory and moves into it.

take() {
        mkdir "$1" && cd "$1";
}

#give command. Exits the current directory and moves it to the trash

give() {
        dir=$(pwd);

        cd .. && trash "$dir";
}

#trash command. Removes files safely by moving them to the trash

trash() {

	for item in $@; do
		mv_safe "$item" ~/.Trash
	done
}

#mv_safe command

mv_safe() {
	from=$(if [[ $1 =~ '/' ]]; then; echo "${1%/*}/"; fi)
	to="$2"
	filename="${1##*/}"
	name="${filename%%.*}"
	ext=$(if [[ $filename =~ '\.' ]]; then; echo ".${filename#*.}"; fi)

	echo "to: '$to'"

	if [[ ! -f $to/$filename ]]; then
		mv "$from$filename" "$to"
	else
		next=1
		
		if [[ "$name" =~ '^.+\([0-9]+\)$' ]]; then
			num=$(echo "$name" | sed 's:.*(\([0-9]*\)).*:\1:')
			name=$(echo "$name" | sed 's:\(.*\)([0-9]*).*:\1:')
			next=$(($num + 1))
		fi
		
		mv_safe "$1" "$to/$name($next)$ext"
	fi
}

# vfy_par verifies the parameters gotten by the function and explains how it is supposed to be used.

vfy_par() {
	supplied=$1
	needed=$2
	format="$3"

	if [ $supplied -lt $needed ]; then
		echo "Provide input in the following format:"
		echo $format
		return -1
	fi
}
