# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

LABEL maintainer="Patrick Windmiller <sysadmin@pstat.ucsb.edu>"

USER $NB_UID


# Install spaCy packages
RUN conda install -c conda-forge spacy && \
    conda install --quiet -y pandas && \
    conda install --quiet -y scikit-learn && \
    conda install --quiet -y matplotlib && \
    conda install --quiet -y nltk && \
    conda install --quiet -y mplcursors && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
