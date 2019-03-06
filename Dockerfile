FROM continuumio/miniconda3

LABEL maintainer=ClimateRisk version=0.5

COPY *.requirements.txt ./
COPY environment.yml ./

# RUN conda config --add channels conda-forge
# RUN conda create -n crtesting python=3
RUN conda config --add channels conda-forge
RUN conda install --yes --file conda.requirements.txt && conda clean -a -y
# RUN pip install -r pip.requirements.txt && rm -rf ~/.cache/pip
ENV PATH /opt/conda/bin:$PATH

