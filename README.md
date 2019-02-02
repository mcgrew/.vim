
=== Installation ===

First, check out the code:

`git clone https://github.com/mcgrew/.vim.git ~/.vim`

Next, install Vundle:

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Now, put the following code into `~/.vimrc`:

`source ~/.vim/vimrc.vim`

Next, run vim, ignoring any warnings, and enter the command `:PluginInstall`.
You should see a new pane open with plugin names that are being installed. Now,
Exit vim and change to the YouCompleteMe plugin directory:

`cd ~/.vim/bundle/YouCompleteMe`

Run the installer with any language completers you'll want:

`python install.py --clang-completer --java-completer`

More information YCM's options can be found on
[the github page](https://github.com/Valloric/YouCompleteMe/blob/master/README.md)

