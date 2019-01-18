FROM continuumio/miniconda3

LABEL maintainer=ClimateRisk version=0.2

COPY *.requirements.txt ./
COPY environment.yml ./

# RUN conda config --add channels conda-forge
RUN conda env create -n env -f environment.yml && conda clean -a -y
ENV PATH /opt/conda/envs/env/bin:$PATH

