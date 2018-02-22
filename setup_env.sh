#!/bin/bash

function sublime {
  SUBL_PATH='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  if [ -e "$SUBL_PATH" ]
  then
    mkdir $HOME/bin
    cd $HOME/bin
    ln -sf "$SUBL_PATH" subl
  else
    echo 'Could not find `subl` at this path:'
    echo $SUBL_PATH
  fi
}

function aliases {
  cd
  ln -sf $HOME/workspace/rc-files/bashrc .bash_profile

  for i in gitconfig pryrc psqlrc screenrc vimrc
  do
    ln -sf $HOME/workspace/rc-files/$i .$i
  done
    
}

function python_util {
  mkdir -p $HOME/lib/python
  ln -sf $HOME/workspace/rc-files/util.py $HOME/lib/python
}

sublime
aliases
python_util
