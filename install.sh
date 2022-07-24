#!/usr/bin/bash
echo '''
  ______  _____  _    _    _____  ______  _______  _    _  _____  
 |___  / / ____|| |  | |  / ____||  ____||__   __|| |  | ||  __ \ 
    / / | (___  | |__| | | (___  | |__      | |   | |  | || |__) |
   / /   \___ \ |  __  |  \___ \ |  __|     | |   | |  | ||  ___/ 
  / /__  ____) || |  | |  ____) || |____    | |   | |__| || |     
 /_____||_____/ |_|  |_| |_____/ |______|   |_|    \____/ |_|     
                                                                 
 '''


# Install zsh
echo "Choose your distro:"
echo ''' 
1. Arch
2. Debian or Ubuntu
3. Fedora
0. Other
'''
read distro


# For Arch
if [[ $distro = "1" ]]; then
	sudo pacman -S zsh
fi

# For Debian
if [[ $distro = "2" ]]; then
	sudo apt install zsh -y
fi

# For Fedora
if [[ $distro = "3" ]]; then
	sudo dnf install zsh -y
fi

# For Orher distros
if [[ $distro = "1" ]]; then
	echo "ZSH will not install, please install manualy"
fi


# Set ZSH as default shell
sudo chsh -s /usr/bin/zsh $USER

# Customizing ZSH

touch ~/.zshrc

# Install oh-my-zsh and configure
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
source ~/.zshrc

echo "autoload -U run-help" >> ~/.zshrc
echo "autoload run-help-git" >> ~/.zshrc
echo "autoload run-help-svn" >> ~/.zshrc
echo "autoload run-help-svk" >> ~/.zshrc
echo "alias help=run-help" >> ~/.zshrc

# Installing oh-my-zsh plugins
cd ~/.oh-my-zsh/plugins 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> 
source ~/.zshrc
echo "zstyle ':completion:*' rehash true" >> ~/.zshrc
source ~/.zshrc

# Install ZSH completions

git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
echo "plugins+=(zsh-completions)" >> ~/.zshrc
echo "autoload -U compinit && compinit" >> ~/.zshrc

# Done!
echo "Done!"

echo "Do you want install language package?[y/n]"
read answer

if [[ $answer = "n"]]; then
	echo "Language packages will not install."
fi

if [[ $answer = "y"]]; then
	echo '''Choose languagepack: 
	1. Turkish
	2. Azerbaijani
	0. Cencel'''

	read lp 
# For Turkish
	if [[ $lp = "1"]]; then

		echo "$(cat ./Lang/tr-zsh.txt)" >> ~/.zshrc

		if [[ $distro = "1"]]; then
			echo "$(cat ./Lang/tr-arch.txt)" >> ~/.zshrc
		fi

	    if [[ $distro = "2"]]; then
			echo "$(cat ./Lang/tr-debian.txt)" >> ~/.zshrc
		fi
        
		if [[ $distro = "3" ]]; then
			echo "$(cat ./Lang/tr-fedora.txt)" >> ~/.zshrc
		fi
	fi

# For Azerbaijani
	if [[ $lp = "2"]]; then

		echo "$(cat ./Lang/az-zsh.txt)" >> ~/.zshrc

		if [[ $distro = "1"]]; then
			echo "$(cat ./Lang/az-arch.txt)" >> ~/.zshrc
		fi

	    if [[ $distro = "2"]]; then
			echo "$(cat ./Lang/az-debian.txt)" >> ~/.zshrc
		fi
        
		if [[ $distro = "3" ]]; then
			echo "$(cat ./Lang/az-fedora.txt)" >> ~/.zshrc
		fi
	fi


fi





