# README

## Ruby version

3.2.2 (Rails 7.0.6)

## Configuration

* Las credenciales del proyecto estan encriptadas con Rails credentials 
(https://edgeguides.rubyonrails.org/security.html#custom-credentials), debe agregar el archivo ```config/master.key``` 
para obtener las credenciales encriptadas. Aunque no deberia ;) para 
facilitar la configuracion dejo a continuacion la clave de encriptacion de las credenciales.
```
d1a2301ef7cc028c04ba6838ee0790cf
```
  
* para ver las credenciales use el comando.
```
EDITOR=nano rails credentials:edit
```
* La base de datos es un free tier de RDS en la nube, no necesita instanciarse localmente

## correr el proyecto

* para correr el proyecto en modo prod use 
```
  RAILS_ENV=production rails assets:precompile
  RAILS_ENV=production rails s
``` 

* para correr el proyecto en modo dev use 
```
  bin/dev
``` 

## Estructura

El valor agregado del proyecto se encuentra en su diseño en Front y Back. Siguiendo la filosofia rails 
(https://rubyonrails.org/doctrine) se implementa un monolito con javascript en importmap (sin webpacker o node).

Para encontrar el chat debe ir a:
```
    http://localhost:3000/chatbot
``` 

El chat esta construido con TailwindCSS (https://tailwindcss.com/), Stimulus.js y Turbo (https://stimulus.hotwired.dev/)
Cuando un usuario envia un mensaje se renderiza y se procesa la respuesta usando TurboStream para obtimizar la carga
de la pagina.

Las opciones que responde el chat ```ChatOption``` estan diseñadas usando una estructura
de lista de nodos enlazada que se recorre usando la relacion ```chat_option.next_option```.

Para mantener un estadar, cada ```ChatOption``` puede disparar una validacion o una accion
definidos en ```app/chatbot```.

Los ```ChatOption```  estan definidos en el archivo ```db/seeds.rb```, alli tambien podra encontrar
los Clientes de prueba, a continuación info.
```
rut         deposito
12345678    1.000 USD
87654321    10.000 USD
```
Cuando se inicia el chat se crea un objeto de tipo ```Conversation```, ahi se almacenan las respuestas
dadas por el usuario.

No entendi muy bien el funcionamiento del deposito. el enunciado no era muy claro al respecto. 