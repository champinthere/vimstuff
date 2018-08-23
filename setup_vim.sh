#!/bin/bash
FDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
VIMRC_FILE="${FDIR}/ubuntu_vimrc"
if [ -f ${HOME}/.vimrc ]; then
    echo "Moving $HOME/.vimrc to $HOME/.vimrc.bak"
    mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
fi
touch ${HOME}/.vimrc
echo "source \$CONFIG_VIMRC" >> ${HOME}/.vimrc
echo "export CONFIG_VIMRC=${VIMRC_FILE}" >> ${HOME}/.bashrc
source ${HOME}/.bashrc
mkdir ${HOME}/.vim &> /dev/null
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

