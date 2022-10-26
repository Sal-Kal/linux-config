#!/bin/bash

sudo apt update

echo

echo "Checking requirements..."

curl --version > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo -ne "Curl...............................\e[1;32m[ OK ]        \e[0m\r"
else
	echo -ne "Curl...............................\e[1;36m[ Installing ]\e[0m\r"
	sudo apt install curl -y > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -ne "Curl...............................\e[1;32m[ OK ]        \e[0m\r"
	else
		echo -ne "Curl...............................\e[1;31m[ ERROR ]        \e[0m\r"
		echo -ne "\n"
		echo "Aborting..."
		exit 0
	fi
fi

echo -ne "\n"

vim --version > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo -ne "Vim................................\e[1;32m[ OK ]        \e[0m\r"
else
	echo -ne "Vim................................\e[1;36m[ Installing ]\e[0m\r"
	sudo apt install vim -y > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -ne "Vim................................\e[1;32m[ OK ]        \e[0m\r"
	else
		echo -ne "Vim................................\e[1;31m[ ERROR ]        \e[0m\r"
		echo -ne "\n"
		echo "Aborting..."
		exit 0
	fi
fi

echo -ne "\n"

ls -a ~/.vim/autoload/ | grep plug.vim > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo -ne "Vim-Plug...........................\e[1;32m[ OK ]        \e[0m\r"
else
	echo -ne "Vim-Plug...........................\e[1;36m[ Installing ]\e[0m\r"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -ne "Vim-Plug...........................\e[1;32m[ OK ]        \e[0m\r"
	else
		echo -ne "Vim-Plug...........................\e[1;31m[ ERROR ]        \e[0m\r"
		echo -ne "\n"
		echo "Aborting..."
		exit 0
	fi
fi

echo -ne "\n"

echo

echo "Configuring Vim..."

echo -ne "Configuration file.................\e[1;36m[ Configuring ]\e[0m\r"
curl -o ~/.vimrc https://raw.githubusercontent.com/Sal-Kal/linux-config/master/vim/vimrc > /dev/null 2>&1
sleep 1
if [ $? -eq 0 ]; then
	echo -ne "Configuration file.................\e[1;32m[ OK ]          \e[0m\r"
else
	echo -ne "Configuration file.................\e[1;31m[ ERROR ]        \e[0m\r"
	echo -ne "\n"
	echo "Aborting..."
	exit 0
fi

echo -ne "\n"

echo -ne "Plugins............................\e[1;36m[ Installing ]  \e[0m\r"
vim +PlugInstall +qa > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo -ne "Plugins............................\e[1;32m[ OK ]        \e[0m\r"
else
	echo -ne "Plugins............................\e[1;31m[ ERROR ]        \e[0m\r"
	echo -ne "\n"
	echo "Aborting..."
	exit 0
fi

echo -ne "\n"

echo

echo "Vim Sucessfully Configured!!"
