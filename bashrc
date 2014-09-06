# source main bashrc file
if [ -f /etc/bashrc ]
then
  source /etc/bashrc
fi

export PYTHONPATH=$HOME/lib/python
export SITEPACKAGES=/Library/Python/2.6/site-packages/django/
export PATH=$PATH:$HOME/bin:$HOME/bin/depot_tools:.
export EDITOR=vim
export DJROOT=/opt/django_root

# otherwise it uses a 64bit version that acts weird with ISA::exporter
export VERSIONER_PERL_PREFER_32_BIT=yes

alias py3k='python3.0'
alias tailf='tail -f'
alias wireshark='sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark'
alias untar='tar -xvf'
alias vi='vim'
alias up='svn update'
alias ssh='ssh -X'
alias ll='ls -l'
alias lt='ls -lrt'
alias gh='history|grep'
alias minicom='sudo minicom'
alias py='ipython'
alias spy='py -i /Users/scattaneo/Library/Python/loader.py'
alias e0='ifconfig en0'
alias e1='ifconfig en1'
alias e2='ifconfig en2'
alias rhino='java -jar $HOME/Library/Java/Extensions/js.jar'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
alias screen='(root; screen -e^\`\` -x -U -RR)'
alias pairscreen='screen'
alias httpy='python -m SimpleHTTPServer'
alias background_start='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &'
alias background_stop='sudo killall ScreenSaverEngine'
alias restart_core_audio="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
alias sitepackage='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
alias sash='source ~/.bashrc'
alias ra='sudo /etc/init.d/apache2 restart'

[[ "$PATH" =~ "git" ]] || export PATH=$PATH:/usr/local/git/bin

function timestamp2epoch {
  date -j -f ‘%Y-%m-%d %H:%M:%S’ ’2011-04-25 12:12:12′ +%s
}

function epoch2timestamp {
  date -r $1
}

function psg {
ps -ef|grep -i $1 |grep -v grep
}

function log {
 cd /var/log
}

function down {
 cd $HOME/Downloads
}

function docs {
 cd $HOME/Documents
}

function work {
  cd $HOME/workspace
}

function desktop {
  cd $HOME/Desktop
}

function sites {
  cd $HOME/Sites
}

function djserver {
  python $mysite/manage.py runserver
}

function djroot {
  cd $DJROOT
}
alias djr='djroot'

function djserver {
  python $DJROOT/manage.py runserver --traceback 0.0.0.0:8000
}
alias djs='djserver'

function djdb {
  if [[ $1 ]]; then
    echo "syncing db for $1 ..."
    python $DJROOT/manage.py schemamigration $1 --auto
    python $DJROOT/manage.py migrate $1
  else
    echo "Please provide a database to migrate"
  fi
}
alias djd='djdb'

function djhelp {
  echo "djroot | djr - go to django root directory"
  echo "djserver | djs - run django dev server"
  echo "djdb | djd - sync the database"
  echo "djhelp | djh - this menu"
}
alias djh='djhelp'


function db {
  djroot
  sqlite3 ./django.db
}

function migrate_tokens {
  djroot
  python ./manage.py schemamigration tokens --auto
  python ./manage.py migrate tokens
}


function status {
  if [[ -e .svn ]]
  then
     svn status
  fi
  if [[ -e .git ]]
  then
    git status
  fi
}
