FROM ubuntu:18.10

LABEL maintainer=ClimateRisk version=0.6

RUN apt-get update 
RUN apt-get install build-essential gcc g++ -y && apt-get clean
RUN apt-get install libgdal-dev -y && apt-get clean
RUN apt-get install python3-gdal python3-pip -y && apt-get clean
RUN apt-get install cython3 -y && apt-get clean

COPY *.requirements.txt ./

# Optimisations from
# https://towardsdatascience.com/how-to-shrink-numpy-scipy-pandas-and-matplotlib-for-your-data-product-4ec8d7e86ee4
RUN CFLAGS="-g0 -Wl,--strip-all -I/usr/include:/usr/local/include -L/usr/lib:/usr/local/lib" \
    pip3 install --no-cache-dir --compile \
    --global-option=build_ext \
    --global-option="-j 3" \
    -r pip.requirements.txt
