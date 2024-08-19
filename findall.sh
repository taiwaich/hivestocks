#!/bin/bash
line=$(head -n 1 apple_daily.csv)
startyear=1980
endyear=2015
echo $line | awk '{split($0,a,","); print  a[1] ","  a[2] "," a[5] "," "stock"  "," "open close diff."}' > newyears.csv

getdata()
{
	echo $stockname
	for i in `eval echo {$startyear..$endyear}`
	do
   		#echo $i
		awk  -v valueis="$stockname" -v patternis="$i-" -F"," '$0~patternis{print $1 "," $2 "," $5 "," valueis "," $5-$2}' "$stockname"_daily.csv   >> newyears.csv
	done
}

stockname=apple
getdata

stockname=yahoo
getdata


stockname=facebook
getdata

stockname=nasdaq
getdata

stockname=twitter
getdata


stockname=netflix
getdata



echo $line | awk '{split($0,a,","); print  a[1] ","  a[2] "," a[5] "," "stock"  "," "open close diff."}' > sortdata.csv
sort -t\, -k 4,4 -k 1,1 newyears.csv >> sortdata.csv

filedate=$(date -r sortdata.csv "+%m-%d-%Y")
echo $filedate

