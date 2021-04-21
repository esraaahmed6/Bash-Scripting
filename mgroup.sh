#!/usr/bin/bash
function addgroup {
read -p " ENTER GROUP NAME " grp
var=$(cat ~/ourproject/user_group | awk -F: '{ print $1 }' | grep -w  $grp)
if [[ -z $var ]]
then 
  {  echo $grp >> ~/ourproject/user_group
     echo 'GROUP HAS BEEN ADDED'
   } 
else
 echo 'THIS GROUP IS ALREADY EXIST '

fi 
}

function removegroup {
 read -p 'enter groupname: ' grp

var=$(cat ~/ourproject/user_group | grep ^$grp )
if [[ -z $var ]]
then
 echo 'not exist'
 else
 { 
  var1=$(cat ~/ourproject/user_group | grep ^$grp | awk -F: '{print $2}')
  if [[ -z $var1 ]]
  then
     { 
        sed -i "/$grp/d" ~/ourproject/user_group
        echo 'group deleted'
      }
   else
    echo 'not empty'
  fi 
}
fi
}
