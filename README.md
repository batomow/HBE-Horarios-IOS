# HEB Horarios
Proyecto Final para la clase de Desarrollo para Dispositivos Moviles en IOS
Esta es una aplicación prototipo para la consulta de horarios para los trabajadores de HEB 

## Descripción del Sistema 
El siguiente diagrama describe el sistema de manera general. 
![usuario con iphone usando applicacion de HEB horarios apuntando a servidor que a su vez apunta a un servidor a la nube ](https://github.com/batomow/HBE-Horarios-IOS/blob/manual-instalacion/iconos/01b.png?raw=true)

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
Si se quiere correr este proyecto prototipo 

### Creditos y Atribuciones 
Iconos de este manual de instalación hechos por <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://smashicons.com/" title="Smashicons">Smashicons</a>, <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a>, <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/alfredo-hernandez" title="Alfredo Hernandez">Alfredo Hernandez</a>, <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>, <a href="https://www.flaticon.com/authors/pixelmeetup" title="Pixelmeetup">Pixelmeetup</a> de <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

