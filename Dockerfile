FROM jupyter/base-notebook:python-3.7.3

#install some system level packages
USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -yq --fix-missing --no-install-recommends && \
  apt-get install -yq --no-install-recommends apt-utils && \
  apt-get upgrade -yq --no-install-recommends && \
  apt-get install -yq --no-install-recommends \
  build-essential \
  curl \
  fonts-dejavu \
  fuse \
  gfortran \
  g++ \
  git \
  gnupg \
  gnupg2 \
  graphviz \
  keychain \
  libcurl4-openssl-dev \
  libfuse-dev \
  liblapack-dev \
  libssl-dev \
  locate \
  lsb-release \
  make \
  m4 \
  nano \
  rsync \
  tzdata \
  unzip \
  vim \
  zip

# build netcdf with gcc and g-fortran

ENV CC=gcc
ENV FC=gfortran

RUN apt-get install -yq --no-install-recommends \
  libnetcdf-dev libnetcdff-dev

ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]
