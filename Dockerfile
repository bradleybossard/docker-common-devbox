FROM ubuntu:15.04
MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

# Build the image
# docker build --rm -t docker-common-devbox .

# Fire up an instance with a bash shell
# docker run --rm -i -t docker-common-devbox

RUN apt-get update

RUN apt-get remove ack

RUN apt-get install -y git \
                       tig \
                       curl \
                       wget \
                       tmux \
                       vim \
                       grc \
                       tree \
                       ack-grep

# RUN dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep                       

WORKDIR /root
RUN git clone https://github.com/bradleybossard/dotfiles.git
RUN git clone https://github.com/gmarik/vundle.git ./.vim/bundle/vundle
RUN cd dotfiles; sh setup.sh;

ENV TERM xterm

