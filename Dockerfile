FROM jenkins/jenkins:lts

USER root

RUN apt-get update
RUN apt-get install -y curl libunwind8 gettext apt-transport-https

# Based on instructions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install microsoft.qpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'

# Install the .NET Core framework
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.0

# Switch back to the jenkins user.
USER jenkins
