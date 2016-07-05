source ~/.antigen/antigen.zsh
export PATH=/usr/local/bin:$PATH
is_linux () {
  [[ $('uname') == 'Linux' ]];
}

is_osx () {
      [[ $('uname') == 'Darwin' ]]
    }

    antigen use oh-my-zsh
    ## Load various lib files
    antigen bundle robbyrussell/oh-my-zsh lib/
  if is_linux; then
    antigen bundle command-not-found
  fi
  antigen bundle Peeja/ctrl-zsh
  antigen bundle rimraf/k
  antigen theme pygmalion

  antigen apply

source ~/.dotfiles/.bookmarks.zsh

# auto start tmux
if [[ "$TERM" != "screen" ]]
  # && [[ "$SSH_CONNECTION" == "" ]]; then
  ; then
  # Attempt to discover a detached session and attach
  # it, else create a new session

  WHOAMI=$(whoami)
  if tmux has-session -t $WHOAMI 2>/dev/null; then
    tmux -2 attach-session -t $WHOAMI
  else
    tmux -2 new-session -s $WHOAMI
  fi
else

  # One might want to do other things in this case,
  # here I print my motd, but only on servers where
  # one exists

  # If inside tmux session then print MOTD
  MOTD=/etc/motd.tcl
  if [ -f $MOTD ]; then
    $MOTD
  fi
fi

