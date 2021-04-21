#!/usr/bin/bash
clear
echo "---------------------------------------------------------------------"
echo "                     Welcome To Our project                          "
echo "---------------------------------------------------------------------"

if [[ ! -e ~/ourproject/user_info ]]; 
    then
        mkdir ~/ourproject
    	  touch ~/ourproject/user_info
          touch ~/ourproject/user_group
        echo "iti:iti:1:1000:iti" >> ~/ourproject/user_info
        echo "esraa:esraa:2:1001:esraa" >> ~/ourproject/user_info
        echo "sara:sara:3:1002:sara" >> ~/ourproject/user_info
	echo "iti:1000" >> ~/ourproject/user_group
	echo "esraa:1001" >> ~/ourproject/user_group
        echo "sara:1002" >> ~/ourproject/user_group

fi

select menu in 'Login' 'Change Password' 'Add User' 'Add Group' 'Remove User' 'Remove Group' 'Exit'

       	do 

                if [[ $menu == "Login" ]]
                then
                        clear;
                        echo "--------------"
                        echo "|option:Login|"
                        echo "--------------"
                        source ./system.sh
                        login
                fi

                if [[ $menu == "Change Password" ]]
                then
                        clear;
                        echo "------------------------"  
                        echo "|Option:Change password|"
                        echo "------------------------"
                        source ./system.sh
                        chpasswd
                fi

		if [[ $menu == "Add User" ]]
		then
			clear;
                        echo "---------------------"
			echo "|option:Add New User|"
			echo "---------------------"
		        source ./muser.sh
                        adduser
		fi

		if [[ $menu == "Add Group" ]]
		then
			clear;
			echo "---------------------"
                        echo "|option:Add New Group|"
                        echo "---------------------"
			source ./mgroup.sh
                        addgroup
		fi 

		if [[ $menu == "Remove User" ]]
		then
			clear;
                        echo "--------------------"
			echo "|option:Remove User|"
			echo "--------------------"
                        source ./muser.sh
                        removeuser			 
		fi

		if [[ $menu == "Remove Group" ]]
		then
			clear;
                        echo "---------------------"
			echo "|Option:Remove Group|"
			echo "---------------------"
			source ./mgroup.sh
                        removegroup
		fi

		if [[ $menu == "Exit"  ]]
		then 
                        clear;
			break;
		fi

        done


