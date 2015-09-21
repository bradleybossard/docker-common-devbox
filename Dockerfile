FROM ubuntu:14.10
MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

# Build the image
# docker build --rm -t docker-devbox-common .

# Fire up an instance with a bash shell
# docker run --rm -i -t docker-devbox-common

RUN apt-get update

RUN apt-get remove ack

RUN apt-get install -y git \
                       tmux \
                       vim \
                       ack-grep

WORKDIR /root

ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.vimrc ./.vimrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.tmux.conf ./.tmux.conf
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.gitconfig ./.gitconfig
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.git_completion ./.git_completion
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.bashrc ./.bashrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.ackrc ./.ackrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.bash_aliases ./.bash_aliases

RUN git clone https://github.com/gmarik/vundle.git ./.vim/bundle/vundle
# git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle

# Install Vundle Bundles
RUN vim +BundleInstall +qall



