# My dotfiles

1. install [antigen](https://github.com/zsh-users/antigen)

    ``$ mkdir ~/.antigen``

    ``$ git clone https://github.com/zsh-users/antigen.git ~/.antigen/``

2. install [rcm](https://github.com/thoughtbot/rcm)

    Mac:

        $ brew tap thoughtbot/formulae

        $ brew install rcm

    CentOS:

        cd /etc/yum.repos.d/
        wget http://download.opensuse.org/repositories/utilities/CentOS_6/utilities.repo
        yum install rcm
        
    Arch:
       
        ``skip for Arch Linux``

3. install [vundle](https://github.com/VundleVim/Vundle.vim):

     ``$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim``

4. install [tpm](https://github.com/tmux-plugins/tpm)

5. install antiword

6. clone this repository

     ``$ git clone https://github.com/stargoo/dotfiles/ ~/.dotfiles``

7. create links to dotfiles
    
    Mac and CentOS:
    
        run ``rcup -v``

    Arch:
    
        cd ~/
        ln -s ~/.dotfiles/name_of_file .name_of_file
        
8. start vim and run command
    
     ``:PluginInstall``

9. Install tmux plugins

        ctrl-f I

9. install sag if you haven't already.  
     ``https://github.com/sampson-chen/sack``

## TODO
1. create script to auto install antigen and rcm
2. create bootstrap for all installations

