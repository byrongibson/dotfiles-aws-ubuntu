#!/bin/sh

# To be run from ~/
mkdir bin && cd bin

# Install from repos
sudo aptitude install -y vim
sudo aptitude install -y ssh 
sudo aptitude install -y git-core git-doc git-completion git-svn
sudo aptitude install -y python-setuptools python-virtualenv virtualenvwrapper python-pip
sudo aptitude install -y zsh zsh-doc zsh-lovers

# Generate SSH keys for this machine
# This part may not be able to be automated, requires manual password creation
#ssh-keygen

# Setup git
git config --global user.name "Byron Gibson"
git config --global user.email fbg111@gmail.com

# Install from github
mkdir ~/bin/Git && cd ~/bin/Git

git clone git://github.com/nvie/gitflow.git
git clone git://github.com/bobthecow/git-flow-completion.git
git clone git://github.com/markgandolfo/git-bash-completion.git
git clone git://github.com/rtomayko/git-sh.git
git clone git://github.com/github/gitignore.git

mkdir ~/bin/ZSH && cd ~/bin/ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git

mkdir ~/bin && cd ~/bin
git clone git://github.com/vim-scripts/Zenburn.git

# Setup Zenburn
#sudo cp Zenburn/colors/zenburn.vim /usr/share/vim/vim73/colors/

# Setup Gitflow, Gitflow Completion, Git Bash Completion, Git-sh, gitignore


# Setup zsh
#incomplete, need to auto-configure options
zsh
0
mv .zshrc .zshrc-original
cp bin/ZSH/oh-my-zsh/templates/ 

