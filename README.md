
# Installation #

First, check out the code:

`git clone https://github.com/mcgrew/.vim.git ~/.vim`

Next, install Vundle:

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Now, put the following code into `~/.vimrc`:

`source ~/.vim/vimrc.vim`

You may also add any custom configuration to this file that you may need.
Some useful options that may be needed when running vim from a Windows-based
terminal:

```
set ttymouse=sgr          " To fix broken mouse support
set t_ut=                 " To fix broken highlight coloring
set term=screen-256color  " To let vim know about 256 color support
```

Next, on Linux, you can run the following command:

`echo -e ":PluginUpdate\nwqa" | vim`

Or just run vim, ignoring any warnings, and enter the command `:PluginInstall`
from normal mode.  You should see a new pane open with plugin names that are
being installed.

The following plugins are installed by default:

* VundleVim/Vundle.vim
* Valloric/YouCompleteMe
* morhetz/gruvbox
* godlygeek/tabular
* terryma/vim-multiple-cursors
* scrooloose/nerdtree
* Xuyuanp/nerdtree-git-plugin
* airblade/vim-gitgutter

If there are any other plugins you wish to add, put them in the `plugins.vim`
file before running the install.

Once that completes, exit vim if needed and change to the YouCompleteMe plugin
directory:

`cd ~/.vim/bundle/YouCompleteMe`

Run the installer with any language completers you'll want, e.g:

`python3 install.py --clang-completer --java-completer`

Python completion is always supported. You can see the available completers with

`python3 install.py --help`

More information YCM's options can be found on
[the github page](https://github.com/Valloric/YouCompleteMe/blob/master/README.md)

# Features #

## Normal mode ##

The following features only work in normal mode unless otherwise noted.

### Switching panes ###

`Ctrl+h`, `Ctrl+j`, `Ctrl+k`, and `Ctrl+l` allow you to navigate to other panes
if you have more than one open. These are analogous to cursor movements with
those keys.

### Diffing with git ###

`Ctrl+d` opens the current file side by side with the latest version of the file
checked into git in diff mode. If the file has not changed, it is compared with
the previous commit.

If you wish to compare with a different revision or branch, you can do so with:
`:call Diff("<revision/branch>")`

*Note: occasionally this will cause a buffer to be unmodifiable when you close a
diff and open a different file with `:vsplit`. Executing `:set modifiable` will
correct this. This is a known issue.*

### Copy (yank) remainder of line ###

`Shift+Y` will copy the remainder of the line to the vim clipboard (analogous to
`Shift+D` to cut the remainder of the line).

### Function documentation comment block ###

`F4` creates a function comment block shell for the current function when
pressed with the cursor on the declaration line of the function. The format of
this may vary depending on the language.

### Toggle Comment ###

`Ctrl-/` (control + slash) will toggle commenting of a line. This only works if
vim knows the proper commentstring for a file type. This also works in visual
mode.

*Note: SSH for windows may not pass Ctrl-/ and certain other key combinations
through to host. SSH within WSL will. If windows built-in SSH must be used and
this feature does not work, you can change the key combination in `vimrc.vim`
(look for ToggleComment)*

### Mouse support ###

Ctrl+m (or Enter) will toggle mouse support on and off. This can be useful for
copying text to the system clipboard. It is on by default.

### Accidental F1 ###

`F1` is mapped to `ESC` since I often hit it when trying to hit escape and I
almost never want the help pane. This also works in insert mode.

### Nerdtree ###

`Ctrl+t` will toggle a file list of the current directory in a pane on the left.

