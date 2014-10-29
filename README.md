This configuration is mainly used from a brew-installed command line `vim`, but it should work with any other vim distributions.

## Usage

To get it running on your machine, you first need to clone this repository:

```sh
git clone https://github.com/caiofilipini/dotvim.git ~/.vim
```

Then create a symbolic link to `.vim/vimrc`, so it becomes your local configuration:

```sh
ln -s ~/.vim/vimrc ~/.vimrc
```

I use Vundle to manage the plugins, so next step is getting it installed:

```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Now, to install the plugins on your machine, you can run the following command (*NOTE*: because the plugins are not yet installed, you might see some errors on the command line; just press `ENTER` to ignore them and install the plugins):

```sh
vim +PluginInstall +qall 
```

You should be all set. Enjoy!
