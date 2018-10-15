#!/bin/sh

# ¬ывести списки пользователей, принадлежащих к более чем указанному количеству групп

for user in $( getent passwd | sed s/:.*// )
do
        if [ $( groups $user | wc -w ) -gt "$1" ]
        then
                echo "$user"
        fi
done