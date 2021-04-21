#!/usr/bin/bash

function login {
	read -p "Enter Username:" username
	exit=$(grep -c ^$username ~/ourproject/user_info)
	grp=$(grep  ^$username ~/ourproject/user_info| cut -d : -f 5)
	if [[ $exit == 1 ]] 
	then
		read -p "Enter Password:" password
		passwd=$(grep  ^$username ~/ourproject/user_info | cut -d : -f 2)
		
		if [[ $password == $passwd ]]
		then
			echo "logged in successfully."
			PS1="[$username:group->$grp]$ "
			PS3="[$username:group->$grp]$ "
		else
			echo "Username or Password is incorrect"
			return
		fi
	else 
		echo "Username or Password is incorrect"
		return
	fi

}

function chpasswd {

	read -p "Enter Username: " username
	exit=$(grep -c ^$username ~/ourproject/user_info)

	if [[ $exit == 1 ]] 
	then
		read -p "Enter old Password: " password
		
		passwd=$(grep  ^$username ~/ourproject/user_info | cut -d : -f 2)
		userLine=$(grep -n ^$username ~/ourproject/user_info | cut -d : -f 1)


		if [[ $password == $passwd ]]
		then
			oldPasswd=$(cut -d : -f 2 ~/ourproject/user_info | grep ^$password)
			read -p "Enter New Password: " newPasswd
			if [[ $username == $oldPasswd ]]
			then
				sed -i "$userLine s/$oldPasswd/$newPasswd/2" ~/ourproject/user_info
			else
				sed -i "$userLine s/$oldPasswd/$newPasswd/1" ~/ourproject/user_info
			fi
		else
			echo "Password incorrect"
			return
		fi

	else 
		echo "Password incorrect"
		return
	fi
}
