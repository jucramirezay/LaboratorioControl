# LaboratorioControl
Repositorio del laboratorio de control, contiene los códigos para el funcionamiento del laboratorio, descargar la carpeta, separar las guías y los códigos del Arduino y NodeMCU y ejecutar el archivo broker.js que se encuentra en la carpeta "servidor" con el comando "node broker.js".

El servidor contiene una serie de frameworks y paquetes en uso, sin embargo, lo mejor para el usuario es instalarlos por cuenta propia, ya que las versiones pueden variar en gran medida. 

Para instalar los paquetes basta con utilizar el comando. 

npm install nombrePaquete --save

En muchos casos es necesario el uso del super usuario (sudo) para realizar la instalación de manera correcta. La instalación se debe realizar en la carpeta raiz del servidor, es decir, la caperta donde esta ubicado el archivo broker.js. A continuación se brinda el ejemplo de como instalar los paquetes utilizados en el servidor.

sudo npm install chart.js --save \\
sudo npm install ejs --save \\
sudo npm install express --save \\
sudo npm install mosca --save \\
sudo npm install mqtt --save \\
sudo npm install socket.io --save \\

Estos paquete se instalan en una carpeta llamada node_modules, la cual se ubica en la carpeta donde se realizó la instalación. 

Se tienen los códigos del Arduino y del NodeMCU para cada experimento. 

Finalmente, se anexan dos guías, una para el uso del laboratorio, explicando brevemente el objetivo de cada experimento, su funcionamiento y la manera de utilizar la interfaz gráfica. La segunda guía indica como anexar un nuevo experimento, demostrando así la escalabilidad del laboratorio. 
