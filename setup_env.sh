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
  ln -sf $WORKSPACE/rc-files/bashrc .bash_profile

  for i in gitconfig pryrc psqlrc screenrc
  do
    ln -sf $WORKSPACE/rc-files/$i .$i
  done
    
}

sublime()
