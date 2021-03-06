# Customized dotfiles

## dotfiles

The dotfiles are how you personalize your system.
You can read more about dotfiles in the holman repo [holman dotfiles](https://github.com/holman/dotfiles).

These dotfiles are mine, focused in Plugins and mappings for Vim.

## Install

First you need to change your shell for **zsh**

Install zsh and set to default:

```sh
sudo apt-get install zsh
chsh -s /bin/zsh user
```
Then:

```sh
git clone git@github.com:lcostantini/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## Configuration for Vim

In the file **vimrc.symlink** you can find all the plugins and configuration that i use for vim.
You can find the file **vimrc.symlink** in ~/.dotfiles/vim/

The best way to install and configuration all is with the plugin [Vundle](https://github.com/gmarik/Vundle.vim)
You can read about Vundle in the link or simply can do this:
```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Then launch vim and run:
```sh
:PluginInstall
```

## Contributing

In vim/vimrc.symlink you will see all the plugins and mappings
that i used and a short description about each one.

If you want to colaborate [Fork it](https://github.com/lcostantini/dotfiles/fork),
remove what you don't use, and build on what you do use.

## Info

I forked [Olvap](https://github.com/olvap/dotfiles) dotfiles and start my own.
In master branch we have synchronized the repos and in branch customized i have my own changes.
