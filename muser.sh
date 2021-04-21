#!/usr/bin/bash
function adduser {
         echo " enter username : "
    read user
    var=$(cat ~/ourproject/user_info | awk -F: '{print $1}' | grep -w $user)
     if [[ -z  $var ]]
     then
        {
         read -p "enter password " passwd
           password=$passwd
          echo "choose groupname "
          cat ~/ourproject/user_group| awk -F: '{print $1}'
           read groupname
          var2=$(cat ~/ourproject/user_group | awk -F: '{print $1}' | grep -w $groupname)
               if [[ -z $var2 ]]
               then
                   echo "this group not exist"
                      
               else
                  { echo "user added"
                    echo $user":"$password":"$groupname >> ~/ourproject/user_info
                   sed -i "/${groupname}/s/\$/\\:${user}/" ~/ourproject/user_group
    
                    }
               fi
          }
     else  echo "user already found"

                         

     fi 

}


 function removeuser {
	read -p "Enter Username:" username
	exit=$(grep -c ^$username ~/ourproject/user_info)

	if [[ $exit == 0 ]]
	then
		echo "User does not exist so u can't remove him"
		return
	fi

	sed -i /$username/d ~/ourproject/user_info
	echo "User has been deleted"
}
