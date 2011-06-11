#!/bin/sh

# To be run from ~/
mkdir bin && cd bin

# Install from repos
sudo aptitude install -y vim
sudo aptitude install -y git-core,git-doc,git-completion,git-svn
sudo aptitude install -y python-setuptools,python-virtualenv,virtualenvwrapper,python-pip
sudo aptitude install -y zsh,zsh-doc,zsh-lovers

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
sudo cp Zenburn/colors/zenburn.vim /usr/share/vim/vim73/colors/

# Setup packages

