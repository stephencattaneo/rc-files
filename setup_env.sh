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

aliases
python_util
