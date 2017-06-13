# Create "Download" folder
mkdir -p downloads
cd downloads

wget https://repo.continuum.io/archive/Anaconda3-4.2.0-MacOSX-x86_64.sh
bash Anaconda3-4.2.0-MacOSX-x86_64.sh
export ANACONDA_HOME=$HOME/anaconda3/bin
export PATH=$ANACONDA_HOME:$PATH

# Write to Bashrc
echo 'export ANACONDA_HOME=$HOME/anaconda3/bin' >> ~/.bash_profile
echo 'export PATH="$ANACONDA_HOME:$PATH"' >> ~/.bash_profile

conda install -y bcolz
conda install -y opencv
conda upgrade -y --all

# Deep Learning Libraries Python

pip install theano
echo "[global]
device = cpu
floatX = float32" > ~/.theanorc

# Tensorflow
pip install tensorflow

pip install keras
mkdir -p ~/.keras
echo '{
    "image_data_format": "channels_last",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "tensorflow"
}' > ~/.keras/keras.json

# Jupyter Notebook (server conf)
jupyter notebook --generate-config
cd ~
echo "c.NotebookApp.notebook_dir = '$HOME/notebooks/'" >> .jupyter/jupyter_notebook_config.py
mkdir -p notebooks

