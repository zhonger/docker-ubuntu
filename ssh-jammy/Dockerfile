FROM ubuntu:jammy

LABEL maintainer="zhonger zhonger@live.cn"

# APT updates
RUN apt-get update && apt-get upgrade -y \
                   && apt-get install -y apt-transport-https ca-certificates

# Create a no-passowrd sudo user
RUN apt-get update && apt-get install -y sudo \
                   && useradd -m ubuntu -s /bin/bash && adduser ubuntu sudo \
                   && echo "ubuntu ALL=(ALL) NOPASSWD : ALL" | tee /etc/sudoers.d/nopasswd4sudo

USER ubuntu
WORKDIR /home/ubuntu

# Install zsh
RUN sudo apt-get install -y git zsh \
    && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sed -i "s/robbyrussell/bira/" ~/.zshrc \
    && sudo usermod -s /bin/zsh ubuntu

# Fix zsh locale
RUN sudo apt-get install -y locales \
    && sudo locale-gen en_US.UTF-8 \
    && sed -i "3a\export LANG=en_US.utf8" ~/.zshrc \
    && exec zsh

# Adjust Timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN sudo ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && sudo apt-get install -y tzdata

# Install ssh-import-id tool
RUN sudo apt-get install -y ssh-import-id \
    && sudo service ssh restart

# Clean APT-cache
RUN sudo apt-get autoremove -y \
    && sudo apt-get clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]