vimrc
===
This is my vim configuration for both Linux and OS X. It's built around C++ and
Clojure development, primarily.

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
