#### Use latest Ubuntu
FROM ubuntu:focal

LABEL maintainer=ClimateRisk version=0.8

# Update base container install
RUN apt-get update

# Install GDAL dependencies
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3-minimal && apt-get clean
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3-pip && apt-get clean
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libgdal-dev && apt-get clean
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git && apt-get clean

COPY *.requirements.txt ./

RUN pip3 install --no-cache-dir -r pip.requirements.txt

# This will install appropriate version of GDAL
RUN pip3 install GDAL==$(gdal-config --version) --global-option=build_ext --global-option="-I/usr/include/gdal"

RUN git clone --depth=1 https://github.com/Unidata/netcdf4-python && \
    pip3 install ./netcdf4-python && \
    rm -rf ./netcdf4-python
