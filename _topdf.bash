#!/bin/bash          
H='http://localhost:4000/docs'

function massagefile {
	fname=$1
	fname=${fname/_site/$H}
	fname=${fname/%index.html/}
	#fname=${fname/%.html/}
	echo $fname
}
FILES=
function findhtml {
	for file in $1/*.html
	do
	    if [[ -f $file ]]; then
	        #echo File $file
	        fname=`massagefile $file`
	        FILES="$FILES $fname"
	    fi
	done
	for dir in $1/*
	do
	    if [[ -d $dir ]]; then
	    	findhtml $dir
	    fi
	done

}

findhtml "_site"
#echo "----------------"
echo $FILES

wkhtmltopdf --footer-center "Stellar Loyalty Confidential" $FILES $1