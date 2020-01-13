# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# changed to mikebirdgeneau/jupyterlab:latest
FROM jupyter/scipy-notebook

LABEL maintainer="Patrick Windmiller <sysadmin@pstat.ucsb.edu>"

USER $NB_UID

RUN pip install --upgrade pip

# Install Jupyter Lab
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab

# If using JupyterLab
RUN conda install -y nodejs && \
    pip install --upgrade jupyterlab && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyter-matplotlib && \
    jupyter nbextension enable --py widgetsnbextension

# Install spaCy, pandas, scikit-learn, ipympl, matplotlib, nltk and mplcursors packages
RUN conda install -c conda-forge spacy && \
#    conda install -c conda-forge widgetsnbextension && \
    conda install -c conda-forge ipympl && \
#    conda install -c conda-forge widgetsnbextension && \
    conda install --quiet -y pandas && \
    conda install --quiet -y scikit-learn && \
#    conda install --quiet -y matplotlib && \
    conda install --quiet -y nltk && \
    conda install --quiet -y mplcursors && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Adding language model to Spacy
RUN python -m spacy download en

RUN python -m spacy download en_core_web_md
