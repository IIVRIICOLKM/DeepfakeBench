# Copyright@SCLBD
# This Dockerfile aims to build the base image for Deepfakbench.
FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

LABEL maintainer="Deepfake"

# RUN apt install -y software-properties-common
# RUN add-apt-repository ppa:jonathonf/ffmpeg-4

# Install dependencies outside of the base image
RUN DEBIAN_FRONTEND=noninteractive apt update && \
	apt install -y --no-install-recommends automake \
    software-properties-common  \
    build-essential  \
    git  \
    ca-certificates  \
    libfreetype6-dev  \
    libtool  \
    pkg-config  \
    python-dev  \
    python-distutils-extra \
    python3.7-dev  \
    python3-pip \
    cmake \
	&& \
    rm -rf /var/lib/apt/lists/* \
    && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.7 0  \
    && \
    python3.7 -m pip install pip --upgrade

RUN add-apt-repository ppa:jonathonf/ffmpeg-4

RUN apt install -y  \     
    libavformat-dev  \
    libavcodec-dev  \
    libavdevice-dev  \
    libavutil-dev  \
    libswscale-dev  \
    libavresample-dev  \
    libavfilter-dev  \
    libpostproc-dev  \
    ffmpeg

WORKDIR /

# RUN while true; do pkg-config --modversion libavcodec; done;
# Install Python dependencies
RUN pip install --no-cache-dir certifi setuptools

RUN pip install --no-cache-dir dlib==19.24.0
RUN pip install --no-cache-dir imageio==2.9.0
RUN pip install --no-cache-dir imgaug==0.4.0
RUN pip install --no-cache-dir scipy==1.7.3
RUN pip install --no-cache-dir seaborn==0.11.2
RUN pip install --no-cache-dir pyyaml==6.0
RUN pip install --no-cache-dir imutils==0.5.4
RUN pip install --no-cache-dir opencv-python==4.6.0.66
RUN pip install --no-cache-dir scikit-image==0.19.2
RUN pip install --no-cache-dir scikit-learn==1.0.2
RUN pip install --no-cache-dir efficientnet-pytorch==0.7.1
RUN pip install --no-cache-dir timm==0.6.12
RUN pip install --no-cache-dir segmentation-models-pytorch==0.3.2
RUN pip install --no-cache-dir tensorboard==2.10.1
RUN pip install transformers==4.29.2
RUN pip install --no-cache-dir torchtoolbox==0.1.8.2

RUN pip install setuptools==59.5.0
RUN pip install loralib
RUN echo "cython<3.0" >> c.txt
RUN PIP_CONSTRAINT=c.txt pip install pytorchvideo
RUN pip install einops
RUN pip install filterpy
RUN pip install simplejson
RUN pip install kornia

RUN pip install git+https://github.com/openai/CLIP.git


ENV MODEL_NAME=deepfakebench

# Expose port
EXPOSE 6000
