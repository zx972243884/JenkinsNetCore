﻿FROM jenkins/jenkins

MAINTAINER JenkinsNetCore

USER root

# Show distro information!
RUN uname -a && cat /etc/*release



# Based on instructiions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install dependency for .NET Core 3
RUN apt-get update
RUN apt-get install -y curl libunwind8 gettext apt-transport-https

# Based on instructions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install microsoft.qpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'
#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
#    echo "deb http://mirrors.aliyun.com/debian wheezy main contrib non-free" >/etc/apt/sources.list && \
#    echo "deb-src http://mirrors.aliyun.com/debian wheezy main contrib non-free" >>/etc/apt/sources.list && \
#    echo "deb http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free" >>/etc/apt/sources.list && \
#    echo "deb-src http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free" >>/etc/apt/sources.list && \
 #   echo "deb http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free" >>/etc/apt/sources.list && \
 #   echo "deb-src http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free" >>/etc/apt/sources.list

# Install the .NET Core framework
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.0
RUN apt-get clean

# Switch back to the jenkins user.
USER jenkins