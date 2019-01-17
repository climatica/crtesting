FROM continuumio/miniconda3

MAINTAINER ClimateRisk version 0.1

COPY *.requirements.txt ./
COPY environment.yml ./

# RUN conda config --add channels conda-forge
RUN conda env create -n env -f environment.yml
ENV PATH /opt/conda/envs/env/bin:$PATH
