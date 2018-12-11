# Build the quantum containers

cd vnc-ubuntu
docker build -t vnc-ubuntu .
cd ..

cd vscode-ubuntu
docker build -t vscode-ubuntu .
cd ..

cd qsharp-vscode-ubuntu
docker build -t qsharp-vscode-ubuntu .
cd ..

cd jupyter-ubuntu
docker build -t jupyter-ubuntu .
cd ..

cd qc-python-ubuntu
docker build -t qc-python-ubuntu .
cd ..
