cd ~/.vim
git submodule init
git  submodule add  https://github.com/kiteco/vim-plugin.git              pack/kiteco/start/vim-plugin
git  submodule add  https://github.com/sillybun/vim-repl.git              pack/vimpkgs/start/vim-repl
git  submodule add  https://github.com/vim-scripts/indentpython.vim.git   pack/vimpkgs/start/indentpython.vim
git  submodule add  https://github.com/vim-airline/vim-airline.git        pack/vimpkgs/start/vim-airline
git  submodule add  https://github.com/vim-airline/vim-airline-themes.git pack/vimpkgs/start/vim-airlin-themese
git  submodule add  https://github.com/tmhedberg/SimpylFold.git           pack/vimpkgs/start/SimpylFold
git  submodule add  https://github.com/preservim/nerdtree.git             pack/vimpkgs/start/nerdtree
git  submodule add  https://github.com/jistr/vim-nerdtree-tabs.git        pack/vimpkgs/start/vim-nerdtree-tabs
git  submodule add  https://github.com/jnurmine/Zenburn.git               pack/vimpkgs/start/Zenburn
git  submodule add  https://github.com/tpope/vim-fugitive.git             pack/vimpkgs/start/vim-fugitive
git  submodule add  https://github.com/ahw/vim-pbcopy.git                 pack/vimpkgs/start/vim-pbcopy
git  submodule add  https://github.com/majutsushi/tagbar.git              pack/vimpkgs/start/tagbar
git  submodule add  https://github.com/nvie/vim-flake8.git                pack/vimpkgs/start/vim-flake8
git  submodule add  https://github.com/altercation/vim-colors-solarized.git  pack/vimpkgs/start/vim-colors-solarized
git  submodule add  https://github.com/psf/black.git                      pack/vimpkgs/start/black
git  submodule add  https://github.com/sillybun/autoformatpythonstatement.git    pack/vimpkgs/start/autoformatpythonstatement

git add .gitmodules pack/vimpkgs/start/vim-repl pack/vimpkgs/start/indentpython.vim pack/vimpkgs/start/vim-airline pack/vimpkgs/start/vim-airlin-themese
git add .gitmodules pack/vimpkgs/start/nerdtree pack/vimpkgs/start/vim-nerdtree-tabs pack/vimpkgs/start/Zenburn
git add .gitmodules pack/vimpkgs/start/vim-fugitive pack/kiteco/start/vim-plugin pack/vimpkgs/start/vim-pbcopy
git add .gitmodules pack/vimpkgs/start/black pack/vimpkgs/start/autoformatpythonstatement pack/vimpkgs/start/tagbar pack/vimpkgs/start/vim-flake8
git add .gitmodules pack/vimpkgs/start/SimpylFold  pack/vimpkgs/start/vim-colors-solarized

#git pull --recurse-submodules
