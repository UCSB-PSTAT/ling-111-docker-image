# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

LABEL maintainer="Ernesto Espinosa <eespinosa@ucsb.edu>"

USER $NB_UID


# Install spaCy packages
RUN conda install -c conda-forge spacy && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
