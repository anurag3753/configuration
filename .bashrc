## bashrc settings
alias eb="exec bash"
alias br="vi ~/.bashrc"
alias vi="vim"
set -o vi
## Navigation Shortcuts
alias 1="cd ../"
alias 2="cd ../../"
alias 3="cd ../../../"
alias 4="cd ../../../../"
alias 5="cd ../../../../../"
alias 6="cd ../../../../../../"
alias p="pwd"
shopt -s autocd
alias e="exit"
alias tf="tail -f $1"
DATE=`date +%Y%m%d`

# Disable Ctrl-s in teminal
stty -ixon

## Screen Shortcuts
alias sl="screen -list"
alias sc="screen -S $1"
alias sr="screen -D -R $1"
alias sk="screen -X -S $1 quit"

## System Info
alias os=' _(){ lsb_release -a; echo -n "32/64bit:"; arch; hostname; }; _'

## Git Shortcuts
alias up="git submodule update --init --recursive"
alias gpl='_(){ mkdir ../patch$1; git format-patch -$2 --subject-prefix="MY PATCH FORMAT $1" -o ../patch$1 --cover-letter; cp ../patch$1/000* /mypatchpath/; rm /mypatchpath/0000*; }; _' # Remove the coverletter
alias gpc='_(){ mkdir ../patch$1; git format-patch $2~1..$2 --subject-prefix="MY PATCH FORMAT $1" -o ../patch$1 --cover-letter; cp ../patch$1/000* /mypatchpath/; rm /mypatchpath/0000*; }; _'
alias gpcc='_(){ mkdir ../patch$1; git format-patch $2~1..$3 --subject-prefix="MY PATCH FORMAT $1" -o ../patch$1 --cover-letter; cp ../patch$1/000* /mypatchpath/; rm /mypatchpath/0000*; }; _'
alias gr='_(){ git reset --hard HEAD~$1; };_'
alias grb='_(){ git rebase -i HEAD~$1; };_'
alias add_remote="git remote add upstream https://gitenterprise.mycompany.com/mygitrepo.git"
alias sync_remote='_(){ git pull upstream master; git push origin master; }; _'
alias gt="git commit -t ~/.gitmessage"
alias gl="git log"

# Check for valid json syntax
alias json='_(){ python -mjson.tool $1 /dev/null; }; _'

# Tells last update commit id for a submodule
alias lu="git ls-files -s $1"

me="anuragmodi@mycompany.com"
team="myteam@mycompany.com"
mail()
{
  if [ $1 == "me" ]; then
    git send-email --to $me --no-validate $2
  else
    git send-email --to $team --no-validate $2
  fi
}
alias gm=mail

## Daily Handy
alias la="ls -a"
alias ld="ls -d */" # show only directories
alias per="stat -c '%A %a %n' $1"
alias ascii="showkey -a"
alias pss="ps -ef | grep $1"
alias k="ps -ef | grep anuragmodi | grep -v bash |awk '{print $2}' | xargs kill"
alias c="clear"
alias bk=' _(){ cp $1 ${1}.bak; }; _' # make backup file easily
alias line=' _(){ sed -n $1p $2; }; _' # print the contents of a given line
alias lines=' _(){ sed -n $1,$2p $3; }; _' # print all lines between two line numbers
alias mk=' _(){ mkdir -p $1 && cd $_; }; _' # make folder and cd into that
alias dac=' _(){ dir_name="${PWD##*/}"; cd ..; rm -rf $dir_name; mk $dir_name; }; _'
alias ph="readlink -f $1"
# Enable tab completion
#source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

export PS1="$purple\u$yellow \W $ $reset\n:"

# Basic run time setings
conda deactivate
clear
alias sr="screen -r daily"
# FIX: I tried to club screen layout shortcut using bash, but unable to do
#alias lay='\e;^C; layout select $1'