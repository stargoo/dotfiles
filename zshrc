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

