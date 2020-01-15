# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# changed to mikebirdgeneau/jupyterlab:latest
FROM jupyter/scipy-notebook

LABEL maintainer="Patrick Windmiller <sysadmin@pstat.ucsb.edu>"

USER $NB_UID

RUN pip install ipympl && \
    jupyter labextension install jupyter-matplotlib && \
    jupyter labextension update --all && \
    rm /opt/conda/share/jupyter/lab/extensions/jupyter-matplotlib-0.4.*
