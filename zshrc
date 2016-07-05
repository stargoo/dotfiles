# use antigen plugin archtiecture
source ~/.antigen/antigen.zsh

# TODO exports may be better served with a .locally sourced file
export PATH=/usr/local/bin:$PATH

# differ between linux and osx systems
is_linux () {
  [[ $('uname') == 'Linux' ]];
}
is_osx () {
  [[ $('uname') == 'Darwin' ]]
}


# use the built-in command line corrections
setopt correct
# don't always have to use .dots
setopt globdots

antigen use oh-my-zsh
## Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/
# add plugins here
if is_linux; then
  antigen bundle command-not-found
fi
if is_osx; then
  antigen bundle osx
fi
# for going back and forth between command line and vim
antigen bundle Peeja/ctrl-zsh
# for a nicer ls
antigen bundle rimraf/k
# extracting tar.gz and all permutations
antigen bundle extract
# suggest completions
antigen bundle zsh-users/zsh-autosuggestions
# find any part of the history in shell
antigen bundle history-substring-search
# print battery info with battery_pct, battery_time_remaining, etc.  See script for details
antigen bundle battery
# for fun
antigen bundle catimg
# common aliases
antigen bundle common-aliases
# copy current directory to clipboard
antigen bundle copydir
# replace copy verbose cpv with rsync command
antigen bundle cp
# some rsync aliases
antigen bundle rsync
# sudo the last command with Esc-Esc
antigen bundle sudo
# more vi stuff
antigen bundle vi-mode
# websearch from the command line
antigen bundle web-search

# the best theme for me
antigen theme pygmalion
antigen apply

alias mkdir='mkdir -pv'
# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1,1n'
alias psmem10='ps -e -orss=,args= | sort -b -k1,1n| head -10'
# get top process eating cpu if not work try excute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr | head -10'
# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# directory LS
dls () {
    ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"
}

# may want to try the jump plugin, which basically does the same thing.
source ~/.dotfiles/.bookmarks.zsh

# auto start tmux only when someone ssh's into the system
if [[ "$TERM" != "screen" ]] && [[ "$SSH_CONNECTION" != "" ]]; then
  # Attempt to discover a detached session and attach
  # it, else create a new session
  WHOAMI=$(whoami)
  if tmux has-session -t $WHOAMI 2>/dev/null; then
    tmux -2 attach-session -t $WHOAMI
  else
    tmux -2 new-session -s $WHOAMI
  fi
else
  # One might want to do other things in this case
fi

source ~/.dotfiles/.local.zshrc
