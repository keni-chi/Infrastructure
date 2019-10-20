FROM centos:centos7

RUN yum -y update && yum clean all
RUN yum install -y which
RUN yum install -y wget
RUN yum install -y tar
RUN yum install -y vim
RUN yum -y install openssh-server openssh-clients
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN unlink /bin/python
RUN ln -s /bin/python3 /bin/python
RUN ln -s /bin/pip3.6 /bin/pip
# pipはrequirements.txtに集約する
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install pandas

CMD /bin/bash