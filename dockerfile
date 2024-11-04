# Use PyTorch CUDA base image
FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime

USER root

# Install tools.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends curl
RUN apt-get install -y --no-install-recommends wget
RUN apt-get install -y --no-install-recommends git

# Install libraries.
ENV PIP_ROOT_USER_ACTION=ignore
RUN python -m pip install --upgrade pip
RUN pip install numpy==1.24.4
RUN pip install sentencepiece==0.1.99

# Install from source.
COPY . /workspace/gemma/
WORKDIR /workspace/gemma/
RUN pip install -e .