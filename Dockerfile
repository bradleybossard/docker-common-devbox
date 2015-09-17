FROM ubuntu:14.10
MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

# Build the image
# docker build --rm -t docker-devbox-common .

# Fire up an instance with a bash shell
# docker run --rm -i -t docker-devbox-common

RUN apt-get update

RUN apt-get install -y git \
                       ack-grep

# So ack-grep become just ack
# RUN dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.vimrc ~/.vimrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.tmux.conf ~/.tmux.conf
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.git_completion ~/.git_completion
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.bashrc ~/.bashrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.ackrc ~/.ackrc
ADD https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.bash_aliases ~/.bash_aliases

