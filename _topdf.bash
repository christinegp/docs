#!/bin/bash          
H='http://localhost:4000/docs'
HC=$H/concepts
HCS="$HC/ $HC/communications/ $HC/content/"
echo $H
echo $HC
echo $HCS

wkhtmltopdf $H/ $HCS $1