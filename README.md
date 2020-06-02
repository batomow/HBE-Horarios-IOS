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

A acontinuación se explica paso a paso como correr el proyecto, lo unico que se necesita es una computadora **MAC** y acceso a internet.

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
- Podemos inspeccionar los archivos [ViewController.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/HBE%20Horarios%20IOS/ViewController.swift) y  [HorarioViewController.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/HorarioViewController.swift), estos son los controladores principales. 
- Si queremos ver como se realiza la comunicación con el servidor podemos ver estos archivos: [APIRequest.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/APIRequest.swift), [Monolito.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/Monolito.swift)

Con esto nuestros sistema se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/07.svg?raw=true)



3. [Firebase](https://firebase.google.com/) es una plataforma que provee distintos servicios haciendo uso de la nube de [Google](google.com). Nosotros necesitamos una base de datos que podamos acceder desde la red. Estrictamente hablando lo que necesitamos es cualquier servicio en linea que nos pueda regresar esta información en el siguiente formato: 
```
{
    "error": false,
    "message": "Bienvenido!",
    "data": {
        "user": {
            "middleName": "Vidales",
            "password": "hola",
            "firstName": "Paulina",
            "lastName": "Camara"
        },
        "resume0": {
            "total": "--",
            "overtime": "--"
        },
        "resume1": {...},
        "resume2": {...},
        "resume3": {...},
        "resume4": {...},
        "week0": [
            {
                "free": false,
                "entry": "--",
                "total": "0:00",
                "overtime": "0:00",
                "exit": "--",
                "breakLeave": "--",
                "breakReturn": "--",
                "schedule": "8:00-17:30"
            },
            {...},
            {...},
            {..,},
            {...},
            {...},
            {...}
        ],
        "week1": [...],
        "week2": [...],
        "week3": [...],
        "week4": [...]
    }
}
```
En este caso, Firebase nos provee una base de datos NoSQL y realiza el _hosting_ por nosotros de manera gratuita, por lo que solo necesitamos crear una base de datos. Para ello hacemos lo siguiente: 

- Tener una cuenta de [Google](google.com)
- Entrar a la pagina de [Firebase](https://firebase.google.com/). 
- Acceder a nuestra cuenta. (_Sign In_) 
- Damos click en _Get Started_. 
- Damos click en _Add project_. 
- Le damos un nombre al proyecto.
- Le damos _create project_. (Desabilitamos google analitycs para este prototipo).
- Una vez creado el proyecto de la base de datos, le damos continue y seleccionabos el proyecto que creamos. Esto nos llevara a la consola de firebase: 
- Dentro de esta consola le damos click a _Database_ en la columna de la izquierda. 
- Le damos _create database_. 
- Seleccionamos _Production Mode_ y le damos _Next_. 
- Firebase escogera por nosotros la mejor zona. Le damos _Done_. 

La siguientes imagenes muestran parte del proceso. 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb01.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb02.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb03.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb04.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb05.svg?raw=true)


Ahora podemos ver visualmente nuestra base de datos y la podemos poblar. El objetivo es recrear la siguiente estructura: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/DB.svg?raw=true)

La imagen muestra nuestra base de datos. Los rectangulos son _coleciones_ y _subcolecions_, mientras que los documentos son _documentos_. **NOTA: Aunque el dia sea libre o no se hallan registrado horas para un campo, debe de existir ese campo y contener aunque sea "--" o cualquier caracter, de lo contrario el servidor intermediario no podra darle el formato adecuado a los datos y marcara error**

Una vez creada nuestra base de datos, necesitamos generar nuestra _ServiceAccountKey.json_. 
- Nos vamos a _users and permissions_. Donde podemos darle acceso a otros ususarios para trabajar colaborativamente. 
- Seleccionamos la pestaña de _Service Accounts_, donde vendra el codigo exacto que utiliza el BACKEND para connectar con la base de datos que acabamos de crear, asi como un boton azul para generar nuestra _ServiceAccountKey.json_. 
- Le damos click a _Generate new private key_. 
- Renombramos el archivo descargado a _ServiceAccountKey.json_ y lo agregamos a folder de HEB-BACK
**NOTA: Recuerda no agregar el _ServiceAccountKey.json_ al control de versiones, puesto esto quiere decir que cualquiera puede descargar la llave del repositorio y hacer uso malicioso. Imagina que son las llaves de tu casa!** 

Las siguientes imagenes muestran este proceso. 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb06.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb07.svg?raw=true)

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/fb08.svg?raw=true)

Con esto queda creada nuestra base de datos.
 
 
 
4. Nuestro servidor puede ser cualquier aparato que nos permita mandarle y recibir datos usando llamadas http. En nuestro caso vamos a utilizar nuestra computadora. **El repositorio de la aplicación ya esta configurado para hacer llamadas a nuestra computadora, si se quieren hacer llamadas a otro servidor es necesario modificar el [APIRequest.swift](https://github.com/batomow/HBE-Horarios-IOS/blob/master/APIRequest.swift), cambiando el url destino** `44 let resourceString = "http://localhost:8000/api/\(endpoint)`. 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/08.svg?raw=true)

Para esto vamos a utlizar [Node.js](https://nodejs.org/en/). Lo cual nos va a permitir correr un servidor en nuestra computadora: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/09.svg?raw=true)

Para poder correr el codigo de nuestro servidor es neecsario instalar [Node.js](https://nodejs.org/en/). Una vez descargadado introducimos los siguientes commandos en la terminal: 
- Nos movemos al directorio del proyecto: `cd HEB-BACK`
- Para descargar todas las dependencias: `npm install`
- Para correr nuestro proyecto `node index.js`, para correrlo en modo desarrollo `nodemon` 
**NOTA: Si no se agrego el _ServiceAccountKey.json_ a la raíz del proyecto, aqui marcara error. Si se corrio el proyecto con Nodemon el server se quedara colgado, es necesario utilizar `ctrl-c` para matar el proceso y volver a correr el comando.**

Una vez corrido estos comandos exitosamente, la terminal deberia mostrar `listening on port 8000...`,esto significa que esta ventana de la terminal estara corriendo el servidor.
**NOTA: Si por alguna razon se cierra la ventana y no te pregunto si quieres 'terminar el proceso', entonces el servidor seguira corriendo aunque tu no lo veas, para esto puedes abrir otra terminal y correr `killall node` para 'matar' el server.**

Ahora nuestra computadora esta emulando un celular el cual esta corriendo nuestra aplicación y aparte esta corriendo el servidor intermediario, la siguiente imagen muestra lo que acabamos de lograr: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/10.svg?raw=true)

Ahora nuestro sistema se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/11.svg?raw=true)



Ahora que esta creada nuestra base de datos y generamos nuestra _ServiceAccounteKey.json_, agregamos este documento a la raíz del proyecto, es decir, lo metemos al folder HEB-BACK. Ahora firebase lo podemos accesar tan facil como escribir la dirección url en nuestro buscador y consultar la consola. Nuestro servidor hace esto tras cortinas, por lo que no hace falta mas que tener connección a internet para que la aplicación funcione. La siguiente imagen muestra este concepto: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/12.svg?raw=true)

Ahora todo nuestro sistema existe practicamente dentro de nuestra computadora connectada al internet. Nuestro sistema ahora se ve asi: 

!['alt text'](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/13.svg?raw=true)

### Creditos y Atribuciones 
Iconos de este manual de instalación hechos por <a href="https://www.flaticon.com/authors/frepik" title="Freepik">Freepik</a>, <a href="https://smashicons.com/" title="Smashicons">Smashicons</a>, <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a>, <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/alfredo-hernandez" title="Alfredo Hernandez">Alfredo Hernandez</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/pixelmeetup" title="Pixelmeetup">Pixelmeetup</a>, <a href="https://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a>, <a href="https://www.flaticon.com/authors/bqlqn" title="bqlqn">bqlqn</a>, <a href="https://www.flaticon.com/authors/darius-dan" title="Darius Dan">Darius Dan</a>, <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a> de <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

<a target="_blank" href="https://icons8.com/icons/set/xcode">Xcode icon</a> por <a target="_blank" href="https://icons8.com">Icons8</a>

