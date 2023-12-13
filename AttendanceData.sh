#!/bin/bash
#####################################################
#Description
#Splitting the File to create folders according to the
#Filename and copy those files to the respective Folders
#Author: Padmanabhan.J
#####################################################


function foldercreation(){

search_dir=AttendanceData
for fileList in "$search_dir"/*
do
  echo "$fileList"

	# String
	#text="RegistrationData_AIIMS_10_291123_S2_151_WRAPPER"

	# Set space as the delimiter
	IFS='_'

	# Read the split words into an array
	# based on space delimiter
	#read -ra newarr <<< "$text"
        read -ra newarr <<< "$fileList"

	# Print each value of the array by using
	# the loop
	for val in "${newarr[3]}";
	do
	 echo "$val"
	 a=$val
         filename=`echo "$a" | cut -d '.' -f1`
         echo "FILENAME:::"$filename
	 mkdir -p "$filename/${newarr[2]}"     
         #echo "ListValue:::"$val
         cp AttendanceData/*${newarr[2]}*$filename*.pdf $filename/${newarr[2]}
         
	done

#  cp $fileList $val
done

}

function filescopy(){
search_dir=ListFolders
for fileList in "$search_dir"/*
do
  echo "$fileList"

  foldercontains=`echo $fileList | cut -d "_" -f5`
  
 echo $foldercontains

cp $fileList $foldercontains


done
}


foldercreation
#filescopy
