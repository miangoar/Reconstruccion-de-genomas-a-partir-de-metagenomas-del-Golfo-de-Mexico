![Barra](https://user-images.githubusercontent.com/51969194/68169367-74d35c80-ff31-11e9-87e3-6dd06aa1737d.png)

# Reconstrucción de genomas a partir de metagenomas del Golfo de México
Aquí se describen todos los comandos realizados en la tesis de licenciatura ***"Reconstrucción de genomas a partir de metagenomas del Golfo de México"***, *disponible* en: :v

               Autor: Miguel Ángel González Arias (GAMA)                             Año: 2019
                    
                    
![0_1](https://user-images.githubusercontent.com/51969194/68175336-7e1af400-ff46-11e9-9d40-f3f6bf402ca3.png)

Este repositorio está dirigido principalmente a quien no tiene experiencia previa en bioinformática, así como a aquellos interesados en los comandos implementados en la realización de mi tesis de licenciatura. Si bien no soy un experto, este recurso podría servirte para aclarar introducirte a la bioinformática, conocer algunos conceptos básicos, ahorrarte tiempo, reproducir y/o adaptar los análisis realizados en tus proyectos. Si ya tienes experiencia en el tema, puedes saltar directamente a las secciones de análisis para ver los comandos; si detectas errores, tienes dudas o quieres contribuir en este repositorio contáctame en 
> gamamiguelangel@gmail.com 

# Breve introducción a la bioinformática (Que conozco…) 
### Filosofía bioinformática  
La bioinformática se hace principalmente en sistemas operativos Linux y la gran mayoría de software científico se deposita en repositorios. GitHub es el repositorio con más paquetería científica, sin embargo, existen otros repositorios como Bitbucket u otros pertenecientes a Universidades. La bioinformática debe seguir la filosofía de código abierto, pues permite conocer a detalle los análisis realizados en los estudios e incluso mejorarlos. Un buen ejemplo de esto es el proyecto implementado en el desarrollo de Anvi'o (http://merenlab.org/software/anvio/network/) o el artículo “A new genomic blueprint of the human gut microbiota” cuyo código está disponible en https://github.com/Finn-Lab/MGS-gut. 

### Uso de terminales y sistemas operativos con base en Linux 
Para administrar los recursos de un equipo de computo existen dos principales recursos: interfaces graficas y terminales. Las primeras son a las que la mayoría de los usuarios estamos acostumbrados e interpretan mediante acciones comandos que tiene que ejecutarse (arrastres, selección, clicks, etc.). Las terminales hacen exactamente lo mismo, pero no incluyen interfaces graficas a las que los usuarios estén acostumbrados. En estos casos, se emplean líneas de comando que realizan funciones específicas. 

Los sistemas operativos Windows (Microsoft) y macOS (Apple) cuentan con terminales que incluyen el lenguaje de programación Bash, el cual el principal lenguaje implementado en los sistemas operativos Linux (mas no el único). En el caso de los equipos de Apple, la terminal implementada cuenta con una arquitectura (Kernel) basados en el sistema operativo UNIX, exactamente el mismo en el que se construye Linux. Por tanto, sus terminales incluyen los comandos y demás utilidades para interactuar entre ambos sitemas operativos. En el caso de Microsoft, las terminales con Linux solo están disponibles en equipos con arquitectura de 64Bits y Windows 10. Puedes habilitar dicha terminal googleando "Habilitar la terminal de Bash en Windows" o bien te recomiendo encarecidamente probar la terminal "MobaxTerm" (https://mobaxterm.mobatek.net/) la cual es toda una suite gratuita que incluye el intérprete Bash e incluso puede usarse como programa portable. Linux tiene diferentes distribuciones dirigidas a públicos diferentes, la distribución Linux más popular es Ubuntu. Si quieres cambiar de sistema operativo a Linux para iniciar en bioinformática de lleno lo mas recomendable es instalar Ubuntu, pues es una distribución bastante completa que te ahorra algunos pasos (otros ejemplos de distribuciones son Debian, Fedora y Arch). Si descargas Ubuntu es recomendable que descargues cualquier versión que sea LTS (Long Term Support) pues tendrás soporte por más tiempo, aunque puedes actualizar a cualquier otra versión cuando desees. Para instalar Ubuntu en equipos con Windows puedes bootear una USB y al momento de instalar en tu equipo te permite decidir si quieres instalar por completo Ubuntu o si quieres realizar una partición de tu disco duro y tener ambos sistemas operativos

### Conectividad y utilidades 
Las terminales pueden desplegar contenido grafico usando los sistemas de manejo de ventanas X (X11/X-Server). Algunos programas generan resultados interactivos en diferentes formatos de archivos (por ejemplo, Pavian, FastQC, Anvi’o, etc.) y también se pueden visualizar imágenes (.png, .jpg, .svg). Lo mas recomendable es transferir dichos archivos a tu equipo personal, pero en otras ocasiones la información/programa requiere ser visualizado desde servidores, los cuales mandan la información a tu equipo mediante protocolos de tunneling, razón por la cual tendrás que averiguar como implementar un sistema de ventanas X en tu equipo, pues usualmente no vienen implementados en las terminales. Recomiendo nuevamente MobaxTerm debido a que incluye este sistema, así como otras utilidades a las que puedes acceder únicamente descargándolo. Para las terminales de Windows o macOS es necesario implementar servidores X como Xming y XQuartz, respectivamente. 

Otra herramienta extremadamente útil es CyberDuck que es un protocolo de transferencia de archivos (FTP, por sus siglas en inglés) con interfaz gráfica incluida que te permitirá administrar y compartir archivos entre servidores y tu equipo de la forma más simple. Sin embargo, puedes buscar cualquier otro software similar (por ejemplo, FileZilla) que sea de tu agrado. Considera que con CyberDuck es necesario enlazar tu equipo a cualquier servidor vía protocolo Security Shell (SSH, discutido más adelante).
La gran mayoría de programas bioinformáticos requieren de los recursos computacionales de servidores (o equipos personales con buenos recursos; procesadores Intel Core i7 e i9, o AMD Ryzen7 y Ryzen9, tarjetas gráficas dedicadas (por ejemplo, NVIDIA 1060), con discos duros de >1TB, discos de estado solido y sobre con ≥16GB de memoria RAM). Es necesario perder el miedo a administrarse mediante terminales, por lo que tendrás que aprender y familiarizaste con comandos básicos de Bash: cd (change directory), mv (move), ls (list), rm (remove), cp (copy) o man (manual/ayuda) (otros comandos básicos son less, more, cat, mkdir, ln, grep, top, chmod y qstat … investígalos). Al iniciar sesión en terminales desde tu equipo, visualizas solo el contenido de tu computadora, para poder conectarte a los servidores tienes que hacerlo mediante el protocolo de acceso remoto Secure Shell; Para ello tendrás que teclear el siguiente comando: 
```bash
ssh -X usuario@IP_del_servidor 
```

Donde ssh es el comando que ejecuta el protocolo; -X es una opción del comando ssh que declara que también se inicie el X-server para desplegar contenido grafico en caso de que lo ocupes (para ver más opciones de cualquier comando usa: man comando, p. ej. man ssh); usuario es tu nombre en el servidor que previamente te asigno tu administrador de computo al crearte una “cuenta” dentro del servidor; IP_del_servidor es la dirección IP del servidor al que entraras.   

### Trabajo en servidores,
Al iniciar sesión en terminales de sistemas operativos Linux se inicializa la Shell, un programa que hace la conexión entre plataformas e interpreta los registros de tu teclado a líneas de comando de Bash (propiamente es mas complejo, pero para fines didácticos es suficiente). A su vez, la Shell toma registro de los protocolos de seguridad, la librerías, direcciones de archivos y archivos ejecutables para funcionar cada vez que inicias sesión.  En la Fig. 1 se indican los directorios que cualquier sistema de computo tiene que tener para funcionar y el tipo de archivos que hay en ellos. Usualmente el único en el que se tiene actividad en /home/usuario y el resto de los directorios deberá dejarse intacto pues su modificación podría afectar seriamente el funcionamiento del equipo de computo o servidor
![dir](https://user-images.githubusercontent.com/51969194/68442061-8b79ed80-0195-11ea-9e47-44c3315d6bc7.jpg)
> https://linuxconfig.org/filesystem-basics

Te recomiendo realizar “alias” de comandos, los cuales son atajos que te permiten no escribir tanto. Por ejemplo, para acceder un servidor y ahorrarte teclear el comando completo, puedes crear un comando corto, por ejemplo “hola”, para que Bash lo interprete y sepa que al escribir “hola” en realidad estas diciendo “ssh -X usuario@IP_del_servidor”. Busca tutoriales de como hacer alias a partir de terminales de Linux que estén sistemas de Windows, macOS o Linux. Cuando inicias sesión la Shell lee todos los directorios por defecto, pero hay veces en que no se detecta algún programa o ruta a una base de datos que acabas de descargar, para ello un tip es editar Bash_profile, el cual es un documento donde se señala a Bash donde leer la información. Es recomendable que no modifiques nada de lo que ya está, solo añade direcciones que necesites y comenta que es y en que fecha se hizo la modificación. Investiga como modificar tu Bash_profile. 

Para crear y editar archivos se usan editores de texto plano. Nano es en mi experiencia el editor mas simple y amigable para los novicios, aunque existen otros editores como Vim o Micro que ofrecen mas utilidades para la escritura de código. Cada editor tiene sus respectivos controles para editar, cortar, pegar, buscar, etc., por lo que tendrás que revisarlos antes de usarlos. Por ejemplo. 

![tab](https://user-images.githubusercontent.com/51969194/68442060-8ae15700-0195-11ea-9b65-822936454609.jpg)

Para crear un archivo con cualquier editor basta con teclear “nombre_del_editor nombre_del_archivo_a_crear”, o bien puedes teclear directamente el editor, escribir lo que tengas que escribir y al momento de guardar tu trabajo te solicitaran dar un nombre de archivo en el que se registre la información.  Los archivos adoptan el sistema de extensiones, puedes no ponerlos si guardas archivos con extensión .txt será una archivo de texto simple, si lo haces .png se hará en formato de imagen, .pdf en formato de documento PDF, .py en formato de script de Python y así.

Los servidores cuentan con un numero considerable de núcleos de computo para realizar los trabajos (>56 núcleos, mientras que las computadoras domesticas tienen de 4 a 12 generalmente). Los programas pueden ejecutarse directamente en la terminal, sin embargo, no es lo más recomendable pues dependiendo del programa, puede que lleguen a ocupar todos los recursos de RAM y núcleos disponibles. Para ello existen sistemas de administración de recursos, como Oracle Grid Engine o LSF-IBM que distribuyen el trabajo entre los usuarios de un servidor usando scripts en función de cuantos trabajos ha pedido un usuario, cuanta memoria RAM y cuantos núcleos fueron solicitados.  

Los scripts son archivos de texto plano que indican como ejecutar un programa y de hecho son la base de cualquier software bioinformático. Todos los comandos de Bash son de hecho pequeños programas que indican que hacer, todos ellos se encuentran en el directorio /bin y no es recomendable tocarlos. Los scripts son interpretados tanto por los sistemas de administración recursos, así como por la misma Shell.  Dependiendo de su extensión pueden ser scripts hechos en lenguaje Python (.py), Perl (.pl), Java (.jar), C++ (.cpp), Bash (.sh). Cualquier script se puede ejecutar (1) al escribir su nombre directamente (siempre y cuando tenga permisos de ejecución), (2) al escribir un “./” antes de él (por ejemplo, ./programa.sh) o (3) mediante sistemas de manejo de recursos. En este ultimo caso, Bash tiene que interpretar los comandos y se necesita una estructura previa particular conocida como Shebang (preludio) la cual declara que lenguaje se usara, cuantos recursos se emplearan y en donde se computara. Cada administrador de recursos tiene una forma especial de declarar estos parámetros; usualmente los servidores emplean el administrador Oracle Grid Engine el cual necesita de la siguiente estructura (recuadro rojo):

![job](https://user-images.githubusercontent.com/51969194/68442059-8ae15700-0195-11ea-85a0-32973f32c070.jpg)

Donde los números en rojo representan: (1) el lenguaje a usar, por ejemplo, si se usan comandos de Python seria #!/bin/Python; (2) nombre que tendrán los outputs estándar (.e = error; .o outputs estándar), estos archivos se crean por defecto al correr un script (job) con un administrador y en ellos se imprime el progreso del programa o errores que comúnmente se imprimirían en una terminal y es recomendable que se llamen igual que el script para mantener un orden; (3) donde se realizara el computo, en este caso cwd indica el directorio donde se encuentra el script ejecutado (current working directory); (3) numero de núcleos de computo solicitados, en este caso se pide 1 núcleo mediante el protocolo de paralelización mpi; (5) cantidad de memoria RAM solicitada en GB, en este caso 4GB; (6) programa a ejecutar, en este caso el comando “echo” de Bash imprimirá la palabra “Hola mundo”. Todo esto se interpreta mediante el comando “qsub” de Oracle Grid Engine, el cual realiza la solicitud de los recursos de computo y asigna una prioridad al job. Puedes mandar cuantos Jobs quieras (algo que en la jerga lingüística de programación se dice “encolar”) y cada que se desocupen núcleos entraran nuevos jobs. Puedes verificar el estado de tu Job mediante el comando “qstat” el cual desplega lo siguiente (recuadro amarillo):  (a) ID del trabajo, se puede borrar del sistema de manejo mediante el comando “qdel”, o cuando finalice el job puedes consultar la infromacion de ejecucion mediante el comando “qacct -j ID_de_job”; (b) prioridad de ejecución en función de recuros disponibles y solicitados; (c) nombre del script en ejecución; (d) usuario propietario del job; (e) estado de ejecución, r (ejecutándose), t (en preparación), tw (en espera a entrar); (f) fecha de ejecución; (g) modo de administración; (h) número de núcleos solicitados. Recuerda que todo este esquema de administración es propio de Oracle Grid Engine y que cada administrador tiene sus estructuras. 

Finalmente, una de las cosas que mas se hace en bioinformática es buscar respuestas en foros. Los foros mas comunes suelen ser GitHub, BioStars, Researchgate, Stackoverflow, Reddit, etc. Prácticamente cualquier búsqueda que realices seguirá las siguientes sintaxis: (1) What is …; (2) How to …; (3) Tool for …; por ejemplo: What is a kmer?, How to merge two tables in one?, Tools for genome annotation

### Conceptos a investigar 
1.	Repositorios científicos 
2.	Unix, Linux, Bash 
3.	MobaxTerm
4.	Distribuciones de Linux, Ubuntu 
5.	X11/X-server
6.	protocolo de transferencia de archivos (FTP) 
7.	Comandos básicos de Bash
8.	Shell
9.	Secure Shell
10.	Dirección IP
11.	Sistemas de directorios 
12.	Editores de texto 
13.	Alias y bash_profile
14.	Scheduling/Job scheduler 
15.	script
16.	SheBang (como escribir un job/script)

### Videos recomendados 
¿Cómo funciona un procesador? - Desde un transistor hasta una CPU
https://www.youtube.com/watch?v=-ZTekGoR8uQ&t

¿Por qué AMD ha superado a intel? - La guerra de los núcleos
https://www.youtube.com/watch?v=pQgWQ7X32Pw

¿Por qué Linux no es Popular?
https://www.youtube.com/watch?v=NDhJfHhe3e4&t

100 MOTIVOS por los que estudiar INFORMATICA
https://www.youtube.com/watch?v=CTazANzywSA

¿Qué es el Machine Learning?¿Y Deep Learning? Un mapa conceptual 
https://www.youtube.com/watch?v=KytW151dpqU

Github tutorial
https://www.youtube.com/watch?v=cMfDNkA5cVM

De ahora en adelante el símbolo “>” al inicio de la linea representa el despliegue de la información de la terminal.

![1](https://user-images.githubusercontent.com/51969194/68170108-1b206180-ff34-11e9-8f7d-0fe1dc27301f.png)
Ubica tu posición en el servidor y crea nuevos directorios
```bash
pwd 
> /home/user/
mkdir database reads assemble binnining rna_predition annotation scripts
```

Asumimos que los seis metagenomas están en el directorio databases 
```bash
cd database && ls -lh 
total 213G
-rwxrwxr-x 1 lorenzo lorenzo  15G Aug 30  2018 A04_MIL_1_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo  15G Aug 30  2018 A04_MIL_1_R2.fastq
-rwxrwxr-x 1 lorenzo lorenzo 8.6G Aug 30  2018 A04_MIN_2_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo 8.6G Aug 30  2018 A04_MIN_2_R2.fastq
-rwxrwxr-x 1 lorenzo lorenzo  26G Aug 30  2018 A04_SED_1_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo  26G Aug 30  2018 A04_SED_1_R2.fastq
-rwxrwxr-x 1 lorenzo lorenzo 8.0G Aug 30  2018 D18_MAX_1_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo 8.0G Aug 30  2018 D18_MAX_1_R2.fastq
-rwxrwxr-x 1 lorenzo lorenzo  29G Aug 30  2018 D18_SED_1_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo  29G Aug 30  2018 D18_SED_1_R2.fastq
-rwxrwxr-x 1 lorenzo lorenzo  22G Aug 30  2018 E03_SED010_1_R1.fastq
-rwxrwxr-x 1 lorenzo lorenzo  22G Aug 30  2018 E03_SED010_1_R2.fastq
```

Evalúa la calidad de los reads usando stats.pl
```bash 
$ cd ../reads 
$ ls ../databases/*R1* > r1_reads.txt && ls ../databases/*R2* > r2_reads.txt
$ paste r1_reads.txt r2_reads.txt > reads_list.txt  && rm r1_reads.txt r2_reads.txt
$ cp ../scripts /stats.pl . 
$ stats.pl reads_list.txt 

$ ls 
basic_stats_out.txt reads_list.txt stats.pl
```
“basic_stats_out.txt” contiene la información de la calidad de las secuencias 

Evalúa la calidad de los reads usando FastQC
```bash 
fastqc ../database/* -o /home/user/reads/FastQC_results
```
El directorio “FastQC_results” contiene los reportes de calidad (en formato .zip y .html) para los reads paired-end (R1 y R2) de cada uno de los seis metagenomas






![2](https://user-images.githubusercontent.com/51969194/68170109-1b206180-ff34-11e9-8b28-9d6ae64a2951.png)

```bash
Esto es un ejemplo
Binsanity -f . -l $fasta_file -c *lognorm* -p $P1 -m 4000 -x 1000 -v 400 -d 0.95 --log PASS1-log.txt -o PASS1;
cd PASS1
find . -size 0 -delete;
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS1-%u" $num).fna";
       num=$(($num+1));
done
```
```bash
```

```bash
```

```bash
```
![3](https://user-images.githubusercontent.com/51969194/68170106-1a87cb00-ff34-11e9-8cc8-003459b94f6f.png)

## :v a prro 

