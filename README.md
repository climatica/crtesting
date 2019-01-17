## CRtesting docker image

Docker image with all CR software dependencies installed, for quick testing.

## To update:

Check that the conda.requirements.txt file has all the requirements needed by all CR apps - don't remove something unless you've checked that it's not used by any app (`grep -irl '\(import module\|from module import\)' .` in a directory with all apps should return nothing).

Create a new conda env with

    conda create -n climaterisk python=3
    conda activate climaterisk
    conda config --add channels conda-forge
    conda install --file conda.requirements.txt

Then export it

    conda env export > environment.yml
