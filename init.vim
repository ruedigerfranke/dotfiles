"
"    o8o               o8o      .                    o8o
"    `"'               `"'    .o8                    `"'
"   oooo  ooo. .oo.   oooo  .o888oo     oooo    ooo oooo  ooo. .oo.  .oo.
"   `888  `888P"Y88b  `888    888        `88.  .8'  `888  `888P"Y88bP"Y88b
"    888   888   888   888    888         `88..8'    888   888   888   888
"    888   888   888   888    888 . .o.    `888'     888   888   888   888
"   o888o o888o o888o o888o   "888" Y8P     `8'     o888o o888o o888o o888o
"
"   init.vim for vim (and neovim) by Rüdiger Franke
"
"   To use put the following line into your ~/.vimrc
"   `source $HOME/dotfiles/init.vim`

if exists('g:vscode')
  " VSCode Neovim Stuff goes here:
  source $HOME/dotfiles/vim/vscode/init.nvim
else
  source $HOME/dotfiles/vim/basic.vim
  source $HOME/dotfiles/vim/plugins.vim

  source $HOME/dotfiles/vim/plugins/endwise.vim
  source $HOME/dotfiles/vim/plugins/coc.vim
  source $HOME/dotfiles/vim/plugins/fzf.vim
  source $HOME/dotfiles/vim/plugins/startify.vim
  source $HOME/dotfiles/vim/plugins/sayonara.vim
  source $HOME/dotfiles/vim/plugins/fugitive-gitlab.vim

  if has('nvim')
    source $HOME/dotfiles/vim/plugins/telescope.vim
    source $HOME/dotfiles/vim/plugins/treesitter.vim
    source $HOME/dotfiles/vim/plugins/neoscroll.vim
  endif

  source $HOME/dotfiles/vim/theme.vim
  source $HOME/dotfiles/vim/helper.vim
  source $HOME/dotfiles/vim/keybindings.vim

  if has("gui_macvim")
    if has("gui_running")
      source $HOME/dotfiles/vim/macvim.vim
    endif
  endif

  if exists('g:neovide')
    source $HOME/dotfiles/vim/neovide.vim
  endif
endif
