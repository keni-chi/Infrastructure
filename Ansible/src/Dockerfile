FROM ubuntu:trusty
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y python \
  && apt-get install -y software-properties-common \
  && apt-add-repository -y ppa:ansible/ansible \
  && apt-get update \
  && apt-get install -y ansible \
  && apt-get install -y openssh-server \
  && rm -rf /var/lib/apt/lists/*

# empty root password
RUN passwd -d root

# allow root to ssh without password
COPY sshd_config /etc/ssh/sshd_config
