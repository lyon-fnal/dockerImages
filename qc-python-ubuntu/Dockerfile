# qc-python-ubuntu  -- Adds Quantum Computing Python based tools to jupyter-ubuntu
#
#  Adds Qutip, ProjectQ, CirQ, QISKit (and LaTeX too)
#
# docker build -t qc-python-ubuntu .

FROM jupyter-ubuntu

# Install LaTeX
USER 0
RUN apt-get install -y texlive-latex-base build-essential python3-tk latexmk
USER 1000

# Install Qutip
RUN . /headless/anaconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    pip install qutip

# Install projectq
RUN . /headless/anaconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    pip install pybind11 projectq

# Install cirq
RUN . /headless/anaconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    pip install cirq

# Install QISKit
RUN . /headless/anaconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    pip install qiskit qiskit-aqua qiskit-aqua-chemistry

## Won't do Forrest (Rigetti) because you have to request the download

# Add nice extensions to VSCode
RUN code --force --install-extension ms-python.python && \
    code --force --install-extension qiskit.qiskit-vscode && \
    code --force --install-extension waderyan.gitblame && \
    code --force --install-extension yzhang.markdown-all-in-one