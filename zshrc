export PATH="$PATH:$HOME/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:."
export EDITOR=vim

autoload -Uz compinit
compinit -i

# ensure ctrl-a / ctrl-e do the right thing even with editor set to vim
bindkey -e

# zsh hook to set AWS_PROFILE if the file is present in a directory
function chpwd() {
   if [ -r $PWD/.aws_profile ]; then
      source $PWD/.aws_profile
   else
      unset AWS_PROFILE
   fi
}

# k8s
source <(kubectl completion zsh)
alias k=kubectl

# dns clear cache
alias clear_dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'


# history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
HISTFILE=$HOME/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

# Generic Dev
alias tailf='tail -f'
alias untar='tar -xvf'
alias ssh='ssh -X'
alias ll='ls -l'
alias lt='ls -lrt'
alias py='python3'
alias python='python3'
# alias spy='py -i $HOME/Library/Python/loader.py'
alias screen='(root; screen -e^\`\` -x -U -RR)'
alias pairscreen='screen'
alias httpy='python -m SimpleHTTPServer'
alias sitepackage='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
alias sash='source ~/.zshrc'
alias resource='sash'
alias ra='sudo /etc/init.d/apache2 restart'
alias status='git status'
alias grep='/usr/bin/grep -I'
alias g='git'
alias ge="g s -s | perl -pe 's/[ AM?]+(.*)/\$1/' | xargs -I {} code {}"
alias tf='terraform'
setopt interactivecomments
export WORKSPACE=$HOME/workspace

# OSX
alias top='sudo htop'
alias restart_camera_service='sudo killall VDCAssistant'
alias strace='dtruss'
alias background_start='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &'
alias background_stop='sudo killall ScreenSaverEngine'
alias restart_core_audio="sudo kill $(ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}')"
# this assumes you've already done all the things to get a shared pipx environment
alias activate-py='. ~/.local/pipx/shared/bin/activate'


# Utility Functions
function timestamp2epoch {
  date -j -f ‘%Y-%m-%d %H:%M:%S’ ’2011-04-25 12:12:12′ +%s
}


function dockrm {
  container_id=`docker ps -a -q --filter ancestor=$1`
  docker rm --volumes $container_id
  docker image rm $1
}

function git-branch-purge {
  git branch | grep -v main
  if read -q "REPLY?You are about to delete the above branches. Continue?"; then
    git branch | grep -v main | xargs -I {} git branch -D {}
  else
    echo "\njust kidding."
  fi
}

function clean_up_git_branches {
  git checkout main
  git pull origin

  for branch in `git branch`
  do
    if [[ "${branch}" == 'main' ]]
    then
      continue
    fi

    if [[ "${branch}" == '*' ]]
    then
      continue
    fi

    echo "\n\nChecking branch: ${branch}"
    git checkout ${branch}
    git rebase main > /dev/null 2>&1
    if [[ $? != 0 ]]
    then
      echo "🔴 Branch ${branch} does not rebase cleanly -- you have to fix this"
      git rebase --abort
      continue
    fi

    git log --graph --decorate|head -1 | grep "origin/main, origin/HEAD, main"
    if [[ $? == 0 ]]
    then
      echo "🟢 ${branch} is the same as main"
      git checkout main > /dev/null 2>&1
      if read -q "REPLY?Delete branch ${branch} (y/n)? "
      then
        echo "\n👍 Deleting branch"
        git branch -d ${branch}
      else
        echo "\n👎 ok. I won't delete the branch"
      fi
    else
      echo "🔴 Branch ${branch} is not fully merged"
    fi
  done
}


function epoch2timestamp {
  date -r $1
}

function psg {
  ps -ef|grep -i $1 |grep -v grep
}

function lw {
  ll `which $1`
}

function root {
  cd `python -c 'import util; util.write_base_dir()'`
}

function notify {
  osascript -e "display notification \"$*\" with title \"Console Message\" & beep"
}

# Lazy Navigation
function down {
 cd $HOME/Downloads
}

function docs {
 cd $HOME/Documents
}

function work {
  cd $WORKSPACE
}

function desk {
  cd $HOME/Desktop
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
