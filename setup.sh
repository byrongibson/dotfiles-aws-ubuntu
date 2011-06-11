#!/bin/sh

# To be run from ~/
mkdir bin && cd bin

# Install from repos
sudo aptitude install -y vim
sudo aptitude install -y ssh 
sudo aptitude install -y git-core git-doc git-completion git-svn
sudo aptitude install -y python-dev
sudo aptitude install -y python-setuptools python-virtualenv virtualenvwrapper python-pip
sudo aptitude install -y mercurial mercurial-git
sudo aptitude install -y zsh zsh-doc zsh-lovers

# update python-setuptools
sudo easy_install -U setuptools



# Generate SSH keys for this machine
# This part may not be able to be automated, requires manual password creation
#ssh-keygen

# Setup git
git config --global user.name "Byron Gibson"
git config --global user.email fbg111@gmail.com
git config --global github.user byrongibson
git config --global github.token feedmeacat-er-changemetorealtokenmanually
git config --global core.excludesfile ~/.global_ignore
git config --global color.sh auto

##### Pull from github #####
mkdir ~/bin/Git && cd ~/bin/Git

git clone git://github.com/nvie/gitflow.git
git clone git://github.com/bobthecow/git-flow-completion.git
git clone git://github.com/markgandolfo/git-bash-completion.git
git clone git://github.com/rtomayko/git-sh.git
git clone git://github.com/github/gitignore.git

mkdir ~/bin/ZSH && cd ~/bin/ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git

cd ~/bin
git clone git://github.com/vim-scripts/Zenburn.git
##### /Pull #####

##### Install everything #####
cd ~

### Setup Zenburn
sudo cp bin/Zenburn/colors/zenburn.vim /usr/share/vim/vim73/colors/

### Setup Git Bash Completion, Git-sh, gitignore
sudo cp ~/bin/Git/git-bash-completion/git-completion.bash /etc/bash_completion.d/

### Setup Gitflow 
cd ~/bin/Git/gitflow
git submodule init && git submodule update
sudo make install
cd ~

### Setup Gitflow Completion
sudo cp ~/bin/Git/git-flow-completion/git-flow-completion.bash /etc/bash_completion.d/

### Setup ZSH
#incomplete, need to auto-configure options
zsh
0
mv .zshrc .zshrc-original
cp bin/ZSH/oh-my-zsh/templates/ 

### Setup oh-my-zsh
cd ~

# if .zshrc exists, back it up and rename it
if [ -f .zshrc ]
then 
    newname=".zshrc".$(date +%Y%m%d-%H:%M:%N)
    mv ~/.zshrc $newname
fi
ln -s ~/bin/ZSH/oh-my-zsh/ .
ln -s ~/bin/ZSH/oh-my-zsh/templates/zshrc.zsh-template .zshrc

##### /Install #####
