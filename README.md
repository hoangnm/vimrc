# vimrc

## Copy dotfiles to root
Example: 
```
cp .vimrc.vim ~/
cp -R ./vim > ~/.vim
```

## Install tmux plugin manager

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## To use with neovim

Put these lines to ~/.config/nvim/init.vim, then restart neovim. Reference:
https://neovim.io/doc/user/nvim.html#nvim-from-vim

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
au FocusGained * :checktime
source ~/.vimrc
```

