# source main bashrc file
if [ -f /etc/bashrc ]
then
  source /etc/bashrc
fi


export PYTHONPATH=$HOME/lib/python
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home
export PATH=$PATH:$HOME/bin:$HOME/bin/depot_tools:/usr/local/terraform:$JAVA_HOME/bin:.
export EDITOR=vim
export WORKSPACE=$HOME/workspace
export HISTTIMEFORMAT=" [%Y-%m-%d %T %Z] "


alias py3k='python3'
alias py3='py3k'
alias tailf='tail -f'
alias untar='tar -xvf'
alias vi='vim'
alias ssh='ssh -X'
alias ll='ls -l'
alias lt='ls -lrt'
alias gh='history|grep'
alias minicom='sudo minicom'
alias py='python'
alias spy='py -i $HOME/Library/Python/loader.py'
alias e0='ifconfig en0'
alias e1='ifconfig en1'
alias e2='ifconfig en2'
alias screen='(root; screen -e^\`\` -x -U -RR)'
alias pairscreen='screen'
alias httpy='python -m SimpleHTTPServer'
alias background_start='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &'
alias background_stop='sudo killall ScreenSaverEngine'
alias restart_core_audio="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
alias sitepackage='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
alias sash='source ~/.bashrc'
alias resource='sash'
alias ra='sudo /etc/init.d/apache2 restart'
alias status='git status'
alias grep='/usr/bin/grep -I'
alias top='sudo htop'
alias g='git'
alias uni='unicorn -c config/unicorn.rb'
alias ge="g s -s | perl -pe 's/[ AM?]+(.*)/\$1/' | xargs -I {} subl {}"
alias prod_assets='RAILS_ENV=production RAILS_GROUPS=assets  bundle exec rake assets:precompile'
alias node='node --harmony'
alias e='ember'
alias restart_camera_service='sudo killall VDCAssistant'
alias virtualenv3='~/Library/Python/3.6/bin/virtualenv'
alias py3_env='. $WORKSPACE/py3_env/bin/activate'
alias strace='dtruss'

[[ "$PATH" =~ "git" ]] || export PATH=$PATH:/usr/local/git/bin

function gemdir {
  cd `gem environment|perl -ne 'print "$1\n" if $_ =~ /INSTALLATION DIRECTORY: (.*)$/'`
}

function timestamp2epoch {
  date -j -f ‘%Y-%m-%d %H:%M:%S’ ’2011-04-25 12:12:12′ +%s
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

function js {
  cd `python -c 'import util; util.write_js_dir()'`
}

function spec {
  cd `python -c 'import util; util.write_spec_dir()'`
}

function style {
  cd `python -c 'import util; util.write_style_dir()'`
}

function root {
  cd `python -c 'import util; util.write_base_dir()'`
}

function fe {
  cd `python -c 'import util; util.write_frontend_dir()'`
}

function log {
 cd /var/log
}

function notify {
  osascript -e "display notification \"$*\" with title \"Console Message\" & beep"
}

function down {
 cd $HOME/Downloads
}

function docs {
 cd $HOME/Documents
}

function work {
  cd $WORKSPACE
}

function talks {
 cd $HOME/talks
}

function desktop {
  cd $HOME/Desktop
}

function sites {
  cd $HOME/Sites
}


psql-ssh () {
    local_port="$1"
    gateway="$2"
    db_host="$3"
    db_host_port="$4"
    db_name="$5"
    db_user="$6"

    ssh -C -q -f -o "ExitOnForwardFailure yes" -L "${local_port}:${db_host}:${db_host_port}" "${gateway}" sleep 5
    psql -h localhost -p "${local_port}" --variable prompt_prefix="${db_host}" -U "${db_user}" "${db_name}"
}


export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
export PS1='[\u@\h \w]\$ '

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source $HOME/.budget-tracker
source $HOME/.agarirc

