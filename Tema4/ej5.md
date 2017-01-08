Docker creará un contenedor cada vez que ejecutemos un comando con un comando parecido a `sudo docker run -it alpine sh` por ejemplo. Listamos todos los contenedores que tenemos actualmente y escogemos uno para crear una imagen a partir de él:

![lista contenedores](listaContenedores.png)
![creacion imagen](creacionImagenDesdeContenedor.png)

hay que tener en cuenta que Docker no admite nombres de imagen que empleen letras mayúsculas, en caso de usarlas nos dará el error *invalid reference format*.
