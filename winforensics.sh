#!/bin/bash

function fun1() {
echo -e "#####The output will save in file his name is mt.txt#####\n"
  echo "Enter the file name to search metadata about the file"
read y
exiftool $y &>> ex.txt 
   echo "The runing was at $(date)" >> ex.log

   echo "####NEXT STEP####"

  echo -e "#####The output will save in file his name is bn.txt#####\n"
 echo "Will search if the file is hidden another files and will show the offset of all file"
binwalk $y &>> bn.txt
  echo "The runing was at $(date)" >> bn.log

  echo "####NEXT STEP####"
echo -e "#####The output will save in file his name is st.txt#####\n" 

  echo "Will print txt after txt of the file and will save the output in st.txt"

strings $y &>> st.txt
  echo "The runing was at $(date)" >> st.log

}

function fun2() {
  echo -e "#####Will save the output in in folder his name is bex#####"
 echo "Enter the file name to extarct the informations of it"
read z

bulk_extractor $z -o bex &>/dev/null

  echo "The runing was at $(date)" >> bex.log


}


function fun3() {
 echo -e "#####The output will save in folder his name is ft#####\n"
  echo "Enter a file name to restore the deleted files and hidden files"
read s

foremost -t all $s -o ft

  echo "The runing was at $(date)" >>ft.log
}







while true
do

echo "choose one of these options

1. Search informations about the file
2. Extract informations about the file (can use with ram memory)
3. Restore files of a file
4. EXIT"
read x


if [ $x -eq 1 ];then fun1;fi
if [ $x -eq 2 ];then fun2;fi
if [ $x -eq 3 ];then fun3;fi
if [ $x -eq 4 ];then exit;fi
done
