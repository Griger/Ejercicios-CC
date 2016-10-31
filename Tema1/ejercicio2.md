**En la aplicación que se ha usado como ejemplo en el ejercicio anterior, ¿podría usar diferentes lenguajes? ¿Qué almacenes de datos serían los más convenientes?**

Es claro que una vez que hemos trasladado la aplicación a una arquitectura de microservicios podemos emplear distintos lenguajes en cada uno de los microservicios, más en nuestra aplicación que no requiere de una librería demasiado específica como para tener que emplear un lenguaje u otro por ejemplo en la generación de escenas aleatorias.

Ahora bien, en la aplicación original también podríamos emplear distintos lenguajes, en concreto podemos implementar algunas partes de la misma con C o C++ empleando el [NDK](https://developer.android.com/ndk/index.html) oficial de Android que nos permite esto. Aunque claro en esta ocasión no tenemos tanta libertad como una vez que hayamos evolucionado a una arquitectura basada en microservicios.

En cuanto a los almacenes de datos a emplear yo emplearía simplemente una base de datos tipo documental como MongoDB ya que en esencia lo que se va a almacenar van a ser las escenas del usuario y otro tipo de datos que no requieren de una BD de tipo relacional para consultarlos (así ganamos en escalabilidad, rendimiento y alta disponibilidad).

En consultado el siguiente enlace que habla de las ventajas e incovenientes de las BD documentales y relacionales: http://rafinguer.blogspot.com.es/2010/03/analisis-entre-modelo-relacional-y.html

Como no se va a realizar en principio ningún tipo de red social entre los usuarios de esta aplicación no considero que sea necesaria una BD orientada a grafos.

No creo que necesite trabajar con persistencia o trabajar en memoria como las bases de datos de tipo clave-valor.
