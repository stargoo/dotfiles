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
is_ssh () {
  [[-n "$SSH_CLIENT" ]]
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
# for going back and forth between command line and vim
antigen bundle Peeja/ctrl-zsh
# for a nicer ls
antigen bundle rimraf/k

# the best theme for me
antigen theme pygmalion
antigen apply

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
