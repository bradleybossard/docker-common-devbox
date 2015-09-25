FROM ubuntu:14.10
MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

# Build the image
# docker build --rm -t docker-devbox-common .

# Fire up an instance with a bash shell
# docker run --rm -i -t docker-devbox-common

RUN apt-get update

RUN apt-get remove ack

RUN apt-get install -y git \
                       curl \
                       wget \
                       tmux \
                       vim \
                       ack-grep

WORKDIR /root
RUN git clone https://github.com/bradleybossard/dotfiles.git
RUN git clone https://github.com/gmarik/vundle.git ./.vim/bundle/vundle
RUN cd dotfiles; sh setup.sh;
