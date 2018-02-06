# Qt support for vim

Simple Qt support for Qt-based projects.

## Installation:

Use your favourite package manager for Vim.

If you don't have a preferred installation method, I recommend using Vim's
native package management support, simply copy and paste:

	mkdir -p ~/.vim/pack/bundle/start
	cd ~/.vim/pack/bundle/start
	git clone https://github.com/fedorenchik/qt-support.vim.git

## Filetypes:

* C++
* qmake
* qml
* qbs
* qrc -- same as xml

## Status:

| Language | File Type Detection | File Type Plugin |       Syntax       |     Indent    | Compiler | Plugin |
| :------- | :-----------------: | :--------------: | :----------------: | :-----------: | :------: | :----: |
|  Qt C++  |  **+** (extend cpp) |                  | **+** (extend cpp) |               |          |        |
|  qmake   |        **+**        |      **+**       |        **+**       |               |          |        |
|   qml    |        **+**        |                  |        **+**       |     **+**     |          |        |
|   qrc    |   **+** (use xml)   |                  |                    |               |          |        |
|   qbs    |        **+**        |      **+**       |        **+**       |               |          |        |
|    ui    |                     |                  |                    |               |          |        |

## Related works:

* https://github.com/vim-scripts/cpp.vim
* https://github.com/Townk/vim-qt
* https://github.com/kosl90/qt-highlight-vim
* https://github.com/vim-scripts/Qt.vim
* https://github.com/edlanglois/vim-qrc
* https://github.com/vim-scripts/qt2vimsyntax
* https://github.com/pavel-belikov/vim-qtcreator-tasks
* https://github.com/vim-scripts/qmake--syntax.vim
* https://github.com/pavel-belikov/vim-qmake
* https://github.com/artoj/qmake-syntax-vim
* https://github.com/suy/vim-qmake
* https://bitbucket.org/JohnKaul/qbs.vim

## TODO:

* `*.ui` support
* C++ Autocompletion
* Add supported syntaxes to Syntax menu
* QtDoc
