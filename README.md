vimrc
===
This is my NeoVim configuration for both GNU/Linux and MacOS. It's built around C++
and Clojure development, primarily.

## Installation
After cloning into, say, `~/projects/vimrc`, you can install with just two
links.

```bash
# Back up ~/.config/nvim, if it exists
ln -s ~/projects/vimrc ~/.config/nvim
```

## Installing and updating packages
This config uses [lazy.nvim](https://github.com/folke/lazy.nvim), so you'll
get all dependencies installed automatically. Make sure to run `:checkhealth`
after installation.
