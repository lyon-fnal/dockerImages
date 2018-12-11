# Build the quantum containers

cd vnc-ubuntu
docker build -t lyonfnal/vnc-ubuntu .
cd ..

cd vscode-ubuntu
docker build -t lyonfnal/vscode-ubuntu .
cd ..

cd qsharp-vscode-ubuntu
docker build -t lyonfnal/qsharp-vscode-ubuntu .
cd ..

cd jupyter-ubuntu
docker build -t lyonfnal/jupyter-ubuntu .
cd ..

cd qc-python-ubuntu
docker build -t lyonfnal/qc-python-ubuntu .
cd ..
