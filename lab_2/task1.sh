#!/bin/sh

# Вывести списки имён файлов в текущем каталоге, являющихся прямыми ссылками на указанный файл. Список отсортировать по времени доступа

#print list of names in current dir which has direct links on inputed file. Sort by access time
#IFS=$'\n'
fileName="$1"
#echo "$fileName /n"
flag=0
#while [ -n "$2" ]
#do
#       fileName=$[ $fileName+' '+$2 ]
#       shift
#done
#echo "$fileName /n"
#echo "$fileName"
#for file in $( ls -latr )
for file in *
do
#       if  [ -h "$file" ]
         if [ "$fileName" -ef "$file" ]
        then
                if [ "$fileName" != "$file" ]
                then
                        flag=1
                        ls -l "$file" # | grep -w "$fileName"
                fi
        fi
done

if [ "$flag" -eq 0 ]
then
        echo "There are not such files"
fi