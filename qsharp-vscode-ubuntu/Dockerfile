# docker build -t qsharp-vscode-ubuntu .
FROM vscode-ubuntu

USER 0

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get -y install apt-transport-https && \
    apt-get -y update && \
    apt-get -y install aspnetcore-runtime-2.1 && \
    apt-get -y install dotnet-sdk-2.1 && \
    dotnet new -i "Microsoft.Quantum.ProjectTemplates::0.3.1810.2508-preview"

RUN apt-get -y install git 

# See https://stackoverflow.com/questions/49579153/unable-to-load-dll-microsoft-quantum-simulator-runtime-dll
RUN apt-get -y install libgomp1

USER 1000