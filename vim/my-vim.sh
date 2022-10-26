#!/bin/bash

FILE_CONTENT="
inoremap jk <Esc>
\nset number
\nset relativenumber
\nset ai
\nset si
\nset cindent
\nset shiftwidth=4
\nset mouse=a
\nset smarttab
\nset tabstop=4
\nset softtabstop=4
\nfiletype indent on
\nfiletype plugin indent on
\n
\ncall plug#begin()
\n
\nPlug 'http://github.com/tpope/vim-surround' \" Surrounding ysw)
\nPlug 'https://github.com/tpope/vim-commentary' \" For Commenting gcc & gc
\nPlug 'https://github.com/ap/vim-css-color' \" CSS Color Preview
\nPlug 'https://github.com/terryma/vim-multiple-cursors' \" CTRL + N for multiple cursors
\nPlug 'https://github.com/jiangmiao/auto-pairs'
\n
\ncall plug#end()
\n
\nlet mapleader = \" \"
\n
\ninoremap <tab> <Down>
\ninoremap <S-tab> <Up>
\nnnoremap L $
\nnnoremap H 0
\nnnoremap <C-j> <C-d>
\nnnoremap <C-k> <C-u>
\nnnoremap gm :call cursor(0, len(getline('.'))/2)<cr>
\nset completeopt-=preview \" For No Previews
\n
\nhighlight LineNr ctermfg=cyan
"

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
echo -e $FILE_CONTENT > ~/.vimrc
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
