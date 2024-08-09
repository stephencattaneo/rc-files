#!/bin/bash


function aliases {
  cd
  ln -sf $HOME/workspace/rc-files/zshrc .zshrc

  for i in gitconfig pryrc psqlrc screenrc vimrc
  do
    ln -sf $HOME/workspace/rc-files/$i .$i
  done
    
}

function python_util {
  mkdir -p $HOME/lib/python
  ln -sf $HOME/workspace/rc-files/util.py $HOME/lib/python
}

function homebrew {
  `which brew`
  if [[ $? -eq 0 ]]
  then
    echo 'I found homebrew'
  else
    echo 'homebrew is not installed - installing ...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install rbenv mkcert nvm tfenv postgresql@13 python@3.12 awscli gh jq
}

homebrew
aliases
python_util
