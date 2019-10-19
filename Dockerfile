FROM jenkins/jenkins:lts

USER root

# Based on instructions at https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
# Install microsoft.qpg
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

# Install the .NET Core framework
sudo yum install dotnet-sdk-3.0

# Switch back to the jenkins user.
USER jenkins
