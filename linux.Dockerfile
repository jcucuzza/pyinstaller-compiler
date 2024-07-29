FROM ubuntu:20.04

ENV PYTHON3_VERSION=3.11.9
ENV PYINSTALLER_VERSION=6.9.0

# Install Dependencies
RUN apt update -y && \
    apt install -y \ 
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    python3-dev \
    wget && \
    apt-get clean

# Download Python Source Code
RUN wget https://www.python.org/ftp/python/${PYTHON3_VERSION}/Python-${PYTHON3_VERSION}.tar.xz

# Extract the source code
RUN tar -xf Python-${PYTHON3_VERSION}.tar.xz

WORKDIR /Python-${PYTHON3_VERSION}

# Test the system and optimize python
RUN ./configure --enable-optimizations

# Enable shared library
RUN ./configure --enable-shared --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"

# Install Python3
RUN make install
RUN python3 --version

# Download pip3
RUN wget https://bootstrap.pypa.io/get-pip.py

# Install pip3
RUN python3 get-pip.py
RUN pip3 --version

# Install PyInstaller
RUN pip3 install pyinstaller==${PYINSTALLER_VERSION}

WORKDIR /

COPY /linux-entrypoint.sh /linux-entrypoint.sh
RUN chmod +x /linux-entrypoint.sh

ENTRYPOINT [ "./linux-entrypoint.sh" ]
