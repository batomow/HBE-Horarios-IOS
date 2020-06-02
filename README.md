# HEB Horarios
Proyecto Final para la clase de Desarrollo para Dispositivos Moviles en IOS
Esta es una aplicación prototipo para la consulta de horarios para los trabajadores de HEB 

## Descripción del Sistema 
El siguiente diagrama describe el sistema de manera general. 
!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/01.svg?raw=true)

- El **usuario** utiliza la **aplicación** en su celular. 
- La **aplicación** le pide datos al **usuario** y los envia a un [**servidor intermediario**](https://github.com/batomow/HEB-BACK). 
- El [**servidor intermediario**](https://github.com/batomow/HEB-BACK) le da formato a los datos y los reenía a un [**servidor en la nube**](https://firebase.google.com/).
- El [**servidor en la nube**](https://firebase.google.com/) recibe los datos y con ellos extrae los datos de la **base de datos**.
- El [**servidor en la nube**](https://firebase.google.com/) envia los datos extraidos al el [**servidor intermediario**](https://github.com/batomow/HEB-BACK). 
- El [**servidor intermediario**](https://github.com/batomow/HEB-BACK) le da formato a los datos y los reenvía a la **aplicación**. 
- La **aplicación** procesa los datos y despliega la información al **usuario**. 

## Manual de Instalación 
A continuación se presentan las instrucciones para instalar el proyecto en sus distintos casos de uso. 
### Prototipo 
A acontinuación se explica paso a paso como correr el proyecto, lo unico que se necesita es una computadora mac y acceso a internet.

La aplicación para funcionar apropiadamente necesita de todas sus partes presentes.

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/01.svg?raw=true)

- El Cliente
- La aplicación ( FRONTEND ) 
- El servidor ( BACKEND ) 
- La base de datos 

Sin embargo, no contamos contamos con ningun servidor, celular iphone o base de datos, por lo que el objetivo es lograr que todo el sistema corra en nuestra computadora. 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/13.svg?raw=true)

Para lograr esto, vamos a utilizar las siguientes tecnologias.

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/05.svg?raw=true)

1. Descargar el repositorio de la aplicación y del servidor en nuestra computadora. Para esto se puede simplemente usar el boton de download o usar los siguientes comandos en la terminal.
  - Para moverse al escritorio, si esta en español, usar _Escritorio_ en vez de _Desktop_: `cd Desktop` 
  - Para descargar la app: `git clone https://github.com/batomow/HBE-Horarios-IOS.git `
  - Para descargar el server: `git clone https://github.com/batomow/HEB-BACK`
 Para poder editar/ver el codigo de la aplicación es necesario descargar xcode, esto se puede hacer desde la appstore. 
 
 2. Como no contamos con un celular, lo que vamos a hacer es hacer uso del emulador de xcode para poder usar un celular dentro de nuestra computadora. 
 
!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/06.svg?raw=true)

  - Abrimos xcode y le damos al boton de play en la parte superior izquierda. Esto tomara unos segundos pero enseguida podras ver un celular iphone 11 con la app HEB Horarios abierta. Nuestra app necesita mandar y recibir datos por lo que por ahora no uede hacer nada. 
  - Podemos inspeccionar los archivos [ViewController.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/HBE%20Horarios%20IOS/ViewController.swift) y  [HorarioViewController.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/HorarioViewController.swift)
  - Si queremos ver como se realiza la comunicación con el servidor podemos ver estos archivos: [APIRequest.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/APIRequest.swift), [Monolito.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/Monolito.swift)

Con esto nuestros sistema se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/07.svg?raw=true)


3. Nuestro servidor puede ser cualquier aparato que nos permita mandarle y recibir datos usando llamadas http. En nuestro caso vamos a utilizar nuestra computadora. **El repositorio de la aplicación ya esta configurado para hacer llamadas a nuestra computadora, si se quieren hacer llamadas a otro servidor es necesario modificar el [APIRequest.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/APIRequest.swift), cambiando el url destino** `44 let resourceString = "http://localhost:8000/api/\(endpoint)`. 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/08.svg?raw=true)

Para esto vamos a utlizar [Node.js](https://nodejs.org/en/). Lo cual nos va a permitir correr un servidor en nuestra computadora: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/09.svg?raw=true)


  - Para poder correr el codigo de nuestro servidor es neecsario instalar [Node.js](https://nodejs.org/en/). Una vez descargadado introducidomos los siguientes commandos: 
    - Nos movemos al directorio del proyecto: `cd HEB-BACK`
    - Para descargar todas las dependencias: `npm install`
    - Para correr nuestro proyecto `node index.js`, para correrlo en modo desarrollo `nodemon` 
    - Notese que nuestro proyecto no cuenta con el documento _ServiceAccountKey.json_ el cual es necesario para identificarse con la base de datos, por lo que es necesario contar con una cuenta en [firebase](https://firebase.google.com/), crear un proyecto y una base de datos con información. Nosotros para este utilizamos una cuenta personal de uno de los desarrolladores y se les debio haber anexado junto con una copia de este repositorio. Es necesario que _ServiceAccountKey.json_ este agregado a la raiz del proyecto, de lo contrario al ejecutar el ultimo comando, monstrara error. **Ver la seccion 4 en la parte inferior para crear solucionar esto.** 

Una vez corrido estos comandos exitosamente, la terminal deberia mostrar `listening on port 8000...`,esto significa que esta ventana de la terminal estara corriendo el servidor.

Ahora nuestra computadora esta emulando un celular el cual esta corriendo nuestra aplicación y aparte esta corriendo el servidor intermediario, la siguiente imagen muestra lo que acabamos de lograr: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/10.svg?raw=true)

Ahora nuestro sistema se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/11.svg?raw=true)

4. [Firebase](https://firebase.google.com/) es una plataforma que provee servicios haciendo uso de la nube de [Google](google.com), por lo que es necesario contar con una cuenta de [Google](googel.com) para poder hacer los siguientes pasos. 

// TODO: Insertar pasos para crear base de datos en firebase

Ahora que esta creada nuestra base de datos y generamos nuestra _ServiceAccounteKey.json_, agregamos este documento a la raíz del proyecto, es decir, lo metemos al folder HEB-BACK. Ahora firebase lo podemos accesar tan facil como escribir la dirección url en nuestro buscador y consultar la consola. Nuestro servidor hace esto tras cortinas, por lo que no hace falta mas que tener connección a internet para que la aplicación funcione. La siguiente imagen muestra este concepto: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/12.svg?raw=true)

Ahora todo nuestro sistema existe practicamente dentro de nuestra computadora connectada al internet. Nuestro sistema ahora se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/13.svg?raw=true)

### Creditos y Atribuciones 
Iconos de este manual de instalación hechos por <a href="https://www.flaticon.com/authors/frepik" title="Freepik">Freepik</a>, <a href="https://smashicons.com/" title="Smashicons">Smashicons</a>, <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a>, <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/alfredo-hernandez" title="Alfredo Hernandez">Alfredo Hernandez</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/pixelmeetup" title="Pixelmeetup">Pixelmeetup</a>, <a href="https://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a>, <a href="https://www.flaticon.com/authors/bqlqn" title="bqlqn">bqlqn</a>, <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a>, <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a> de <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

<a target="_blank" href="https://icons8.com/icons/set/xcode">Xcode icon</a> por <a target="_blank" href="https://icons8.com">Icons8</a>

