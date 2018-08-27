#!/bin/sh

processes=$(ps ax -o pid= | sed 's/:.*//')
whitelist=$(cat ./whitelist | sed 's/^/"/;s/$/"/')

listed=false
for x in $processes; 
	do
	listed=false
	path=$(lsof -Fn +p $x |grep -A1 txt | tail -n +2 | cut -c2- )
	if [ ! -z "$path" ] ; then
		for y in $whitelist;
			do 
				check=$(echo $y | sed -e 's/^"//' -e 's/"$//')
				if echo ${path} | grep -qe "$check" ; then
					listed=true
				fi				
		done;
		if test "$listed" = "false" ; then
			res=$(echo "n" | minerchk -d $path)
		fi
	fi
done;
results=$(cat /usr/local/minerchk/miner.* | sed 's/:.*//')
if [ ! -z "$results" ] ; then
	echo $results
	$(rm /usr/local/minerchk/miner.*)
	exit 1
else
	$(rm /usr/local/minerchk/miner.*)
	exit 0
fi
