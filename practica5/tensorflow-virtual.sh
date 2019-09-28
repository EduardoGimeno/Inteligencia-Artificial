echo "Instala un entorno de Python 2.7 virtual con Tensorflow y Keras en $HOME/.tensorflow"
sudo apt update
sudo apt full-upgrade
sudo apt install libcupti-dev
sudo apt install python-pip python-dev python-virtualenv
sudo apt install python-tk
cd $HOME
mkdir .tensorflow
cd .tensorflow
virtualenv --system-site-packages .
source bin/activate
easy_install -U pip
pip install --upgrade tensorflow # Comentar si la cpu es del 2017 o mas actual y de intel
#pip install --upgrade intel-tensorflow # Descomentar si la linea de arriba esta comentada
pip install keras
pip install matplotlib
pip install scikit-learn
deactivate
echo "Si no ha habido ningun error, la instalacion es correcta"
echo "Instrucciones para la ejecucion de un programa (ej. P5_demo.py):"
echo " 1- Ubicarse en la carpeta con los ficheros del programa"
echo " 2- Ejecutar el entorno virtual: source $HOME/.tensorflow/bin/activate"
echo " 3- Ejecutar el programa: python P5_demo.py"
echo " 4- Ejecutar para salir del entorno virtual: deactivate"
echo "Aviso: Por lo que sea da errores en los ficheros .py que tengan acentos, asi que borra los acentos que haya"
