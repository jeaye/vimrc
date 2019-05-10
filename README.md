vimrc
===
This is my Vim configuration for both GNU/Linux and MacOS. It's built around C++
and Clojure development, primarily.

## Installation
After cloning into, say, `~/projects/vimrc`, you can install with just two
links.

### Vim
```bash
# Remove ~/.vim and ~/.vimrc if they exist
ln -s ~/projects/vimrc ~/.vim
ln -s ~/projects/vimrc/vimrc ~/.vimrc
```

### Neovim
Follow the normal Vim installation, but also add the following links.
```bash
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim ${XDG_CONFIG_HOME:=$HOME/.config}/nvim
ln -s ~/.vimrc ${XDG_CONFIG_HOME:=$HOME/.config}/nvim/init.vim
```

## Installing and updating packages
This config uses [vim-plug](https://github.com/junegunn/vim-plug), so you'll
need to run `:PlugInstall` and possibly `:PlugUpdate` once you've linked in the
configs. From there, you should occasionally run `:PlugUpdate` to keep your
plugins up-to-date. You can also run `:PlugUpgrade` to upgrade vim-plug itself.
