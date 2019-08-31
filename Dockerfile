FROM tensorflow/tensorflow:1.13.1-py3-jupyter

# Install PiNN
RUN mkdir -p /opt/src
COPY . /opt/src/pinn
RUN pip install /opt/src/pinn
RUN pip install -r /opt/src/pinn/requirements-dev.txt
RUN pip install -r /opt/src/pinn/requirements-extra.txt
RUN jupyter nbextension enable widgetsnbextension --py --sys-prefix
RUN jupyter nbextension enable nglview --py --sys-prefix
RUN jupyter tensorboard enable --sys-prefix

# Setup
CMD unset XDG_RUNTIME_DIR ; jupyter notebook