![Barra](https://user-images.githubusercontent.com/51969194/68169367-74d35c80-ff31-11e9-87e3-6dd06aa1737d.png)

# Reconstrucción de genomas a partir de metagenomas del Golfo de México
Aquí se describen todos los comandos realizados en la tesis de licenciatura "Reconstrucción de genomas a partir de metagenomas del Golfo de México", disponible en: :v

               Autor: Miguel Ángel González Arias (GAMA)                             Año: 2019
                    
                    
![0_1](https://user-images.githubusercontent.com/51969194/68175336-7e1af400-ff46-11e9-9d40-f3f6bf402ca3.png)

Este repositorio está dirigido principalmente a todos aquellos que no tienen experiencia bioinformática alguna, así como a aquellos interesados en los comandos implementados en la realización de mi tesis de licenciatura. Si bien mi experiencia en el área no es marcada, al menos este recurso puede servir para aclarar algunos conceptos, ahorrarse tiempo y reproducir los análisis realizados en la tesis en sus trabajos. En de ser un entendido en el tema puedes saltar directamente a las secciones de análisis, si detectas errores, tienes dudas o quieres contribuir en este repositorio contáctame en gamamiguelangel@gmail.com.
La bioinformática se hace principalmente en sistemas operativos Linux y la gran mayoría de software científico se deposita en repositorios como GitHub, aunque existen otros repositorios como Bitbucket o algunos otros pertenecientes a Universidades. La bioinformática debe seguir la filosofía de código abierto, pues permite conocer a detalle los análisis realizados en los estudios e incluso mejorarlos. Un buen ejemplo de esto es el proyecto implementado en el desarrollo de Anvi'o (https://github.com/merenlab/anvio) o el artículo “A new genomic blueprint of the human gut microbiota” cuyo código esta disponible en https://github.com/Finn-Lab/MGS-gut. 

### Sistemas operativos Linux, lenguaje de programación Bash, trabajo en servidores de cómputo y utilidades 
Para administrar los recursos de un equipo de computo existen dos principales recursos: interfaces graficas y terminales. Las primeras son a las que la mayoría de los usuarios estamos acostumbrados e interpretan mediante acciones (arrastrar, clicks, etc.) comandos que tiene que realizarse. Por su parte, las terminales pueden hacer exactamente lo mismo, pero no incluyen interfaces graficas a las que los usuarios estén acostumbrados. En estos casos, se emplean líneas de comando que realizan funciones específicas. 
Los sistemas operativos Windows (Microsoft) y macOS (Apple) cuentan con terminales que incluyen el lenguaje de programación Bash, el cual el principal lenguaje implementado en los sistemas operativos Linux (mas no el único). En el caso de los equipos de Apple, las terminales que implementan cuentan con una arquitectura (Kernel) basados en el sistema operativo UNIX, exactamente el mismo en el que se construye Linux. Por tanto, sus terminales incluyen los comandos y demás utilidades para interactuar entre ambos sitemas operativos. En el caso de Microsoft, recientemente (~2018) se han implementado terminales con Linux en equipos con arquitectura de 64Bits y Windows 10. Puedes habilitar dicha terminal googleando "Habilitar la terminal de Bash en Windows" o bien te recomiendo encarecidamente probar la terminal "MobaxTerm" (https://mobaxterm.mobatek.net/) la cual es toda una suite gratuita que incluye el intérprete Bash e incluso puede usarse como programa portable. 
Las terminales pueden desplegar contenido grafico usando los sistemas de manejo de ventanas X (X11/X-Server). Algunos programas generan resultados interactivos en formato .html (por ejemplo, Pavian, FastQC, Anvi’o, etc.) y también se pueden visualizar imágenes (.png, .jpg, .svg). Lo mas recomendable es transferir dichos archivos a tu equipo personal, pero en otras ocasiones la información/programa requiere ser visualizado desde servidores, razón por la cual tendrás que averiguar como implementar un sistema de ventanas X en tu equipo, pues usualmente no vienen implementados en las terminales. Recomiendo MobaxTerm debido a que incluye este sistema, así como otras utilidades a las que puedes acceder únicamente descargándolo. 
Otra herramienta extremadamente útil es CyberDuck (Patito) que es un protocolo de transferencia de archivos (FTP) con interfaz gráfica incluida que te permitirá compartir archivos entre servidores y tu equipo de la forma más simple posible sin necesidad de líneas de comando, e incluso administrar los archivos de los servidores. Sin embargo, puedes buscar cualquier otro software similar (por ejemplo, FileZilla) que sea de tu agrado. Considera que con CyberDuck es necesario enlazar tu equipo a cualquier servidor vía protocolo Security Shell (SSH).
La gran mayoría de programas bioinformáticos corren en servidores (o equipos personales con buenos recursos; procesadores Inter Core i7 e i9, o AMD Ryzen7 y Ryzen9, tarjetas gráficas dedicadas, con discos duros de >1TB, discos de estado solido y sobre con >16GB de memoria RAM). Por dicha razón es necesario perder el miedo a administrarse mediante terminales y líneas de comando, por lo que tendrás que aprender y familiarizaste con comandos básicos de Bash: cd (change directory), mv (move), ls (list), rm (remove), cp (copy) o man (manual/ayuda). Aquí hay una liga a dichos comandos.
https://es.wikibooks.org/wiki/El_Manual_de_BASH_Scripting_B%C3%A1sico_para_Principiantes/Comandos_b%C3%A1sicos_de_una_shell



![1](https://user-images.githubusercontent.com/51969194/68170108-1b206180-ff34-11e9-8f7d-0fe1dc27301f.png)

![2](https://user-images.githubusercontent.com/51969194/68170109-1b206180-ff34-11e9-8b28-9d6ae64a2951.png)

![3](https://user-images.githubusercontent.com/51969194/68170106-1a87cb00-ff34-11e9-8cc8-003459b94f6f.png)

## :v a prro 

