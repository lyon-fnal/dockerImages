# Adds Microsoft QSharp to vscode-ubuntu

# docker build -t lyonfnal/qsharp-vscode-ubuntu .
FROM lyonfnal/vscode-ubuntu

LABEL maintainer="lyon@fnal.gov"

USER 0

# See https://docs.microsoft.com/en-us/quantum/install-guide/vs-code?view=qsharp-preview

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get -y install apt-transport-https && \
    apt-get -y update && \
    apt-get -y install aspnetcore-runtime-2.1 && \
    apt-get -y install dotnet-sdk-2.1 && \
    dotnet new -i "Microsoft.Quantum.ProjectTemplates::0.3.1811.2802-preview"

RUN apt-get -y install git 

# See https://stackoverflow.com/questions/49579153/unable-to-load-dll-microsoft-quantum-simulator-runtime-dll
RUN apt-get -y install libgomp1

USER 1000

# Load the QSharp Development Kit VSCode extension
RUN code --force --install-extension quantum.quantum-devkit-vscode

