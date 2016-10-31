**Buscar una aplicación de ejemplo, preferiblemente propia, y deducir qué patrón es el que usa. ¿Qué habría que hacer para evolucionar a un patrón de microservicios?**

En mi caso he optado por analizar la aplicación que desarrollé como objetivo final de mi TFG. Esta [aplicación](https://github.com/Griger/Touch-Learn) está orientada a ayudar a niños pequeños a asimilar conceptos visuales básicos como la forma, el color o el tamaño. Con lo cual el usuario crea una escena compuesta por distintas figuras y se le propone al niño, a modo de juego, que toque algún objeto de la escena. También se programó un pequeño sistema de generación aleatoria de imágenes.

Creo que esta aplicación sigue una arquitectura monolítica de tipo Modelo-Vista-Controlador (MVC):

- **M**: en nuestro caso, y en la versión en la que se encuentra la aplicación, sería solamente el almacenamiento de aquellas escenas que haya creado el usuario (además de otros datos temporales que estemos manejando para le funcionamiento de la aplicación en ejecución).
- **V**: la vista sería toda la interfaz de usuario que se define en esencia a través de *layouts*.
- **C**: serían todas las clases y funciones implementadas para llevar a cabo toda la funcionalidad de la aplicación, ya sea el código que invoca la pulsación de un botón o la clase que representa una figura.

Aunque quizás esta aplicación sea muy simple como para necesitar de un arquitectura basada en microserviciso voy a tratar de proponer una solución para pasar de esta aquitectura monolítica a una basada en microservicios, realizando un despliegue en red. Así, además de los servicios básicos de la aplicación, que serían la generación de imágenes y el juego en sí, vamos a añadir un servicio de log para identificar al usuario y así poder continuar su proceso de aprendizaje desde donde lo dejó, un servicio de log para poder detectar fallos en el funcionamiento de la aplicación u otra información que queramos monitorizar, y una base de datos en la cual almacenemos los datos de los usuarios así como las escenas creadas por los mismos (actualmente las escenas que crea un usuario se almacenan en la memoria del teléfono). Entonces yo distinguiría los siguientes servicios:

- Identificación de usuario.
- Juego.
- Editor de escenas.
- Generador de escenas aleatorias.
- Base de datos.
- Servicio de log.

Así el núcleo de de mi arquitectura sería la aplicación móvil en sí (la capa de interacción con el usuario), con ella tendríamos la interfaz gráfica del usuario además de tener el editor de escenas y el juego, para así tener disponibles todas aquellas herramientas de interacción táctil que ofrece la API de Android. Con lo que seguiría un esquema que en el [libro](http://www.oreilly.com/programming/free/software-architecture-patterns.csp?intcmp=il-prog-free-article-sa15_sa_patterns) sobre arquitecturas que se facilita en el Tema 1 se llamaría *Application REST-based topology*.

Luego a modo de microservicios y con una interfaz API REST tendríamos cada uno del resto de servicios a los que accedería nuestra aplicación según la interacción que hiciese el usuario con la aplicación: el login de usuarios, un servicio de log donde se reportasen los errores, el generador de escenas aleatorias que enviaría la escena generada en formato JSON que es lo usual en este tipo de arquitecturas o XML que es como las codificamos actualmente en nuestra aplicación, y aquellos accesos a la base de datos que fuesen necesarios para almacenar y cargar escenas o acceder a las estadísticas del usuario.

*Aquí dejo el vídeo demo del funcionamiento de la aplicación actual por si fuese necesario: https://www.youtube.com/watch?v=sfQNCcHsYu8*
