![Barra](https://user-images.githubusercontent.com/51969194/68169367-74d35c80-ff31-11e9-87e3-6dd06aa1737d.png)

# Reconstrucción de genomas a partir de metagenomas del Golfo de México
Aquí se describen todos los comandos realizados en la tesis de licenciatura **"Reconstrucción de genomas a partir de metagenomas del Golfo de México"**, *disponible* en repositorio de tesis de la UNAM: http://oreon.dgbiblio.unam.mx/F/1RJEX8PXL3M1CTDGSHAKXKXETJNSEQJQBNI3I94SHSCP1HN6JK-39822?func=full-set-set&set_number=034192&set_entry=000003&format=999

               Autor: Miguel Ángel González Arias (GAMA)                             Año: 2019
                    
Una breve introducción a la reconstrucción y análisis de genomas a partir de metagenomas se presenta en el siguiente webinar dentro del canal de YouTube de la consultora bioinformática Winter Genomics 
https://youtu.be/ckIbT93Qhjc

![0_1](https://user-images.githubusercontent.com/51969194/68175336-7e1af400-ff46-11e9-9d40-f3f6bf402ca3.png)

Este repositorio está dirigido principalmente a quien no tiene experiencia previa en bioinformática, así como a aquellos interesados en los comandos implementados en la realización de mi tesis de licenciatura. Si bien no soy un experto, este recurso podría servirte para aclarar introducirte a la bioinformática, conocer algunos conceptos básicos, ahorrarte tiempo, reproducir y/o adaptar los análisis realizados en tus proyectos. Si ya tienes experiencia en el tema, puedes saltar directamente a las secciones de análisis para ver los comandos; si detectas errores, tienes dudas o quieres contribuir en este repositorio contáctame en 
> gamamiguelangel@gmail.com 

### Filosofía bioinformática  
La bioinformática se hace principalmente en sistemas operativos Linux y la gran mayoría de software científico se deposita en repositorios. GitHub es el repositorio con más paquetería científica, sin embargo, existen otros repositorios como Bitbucket u otros pertenecientes a Universidades. La bioinformática debe seguir la filosofía de código abierto, pues permite conocer a detalle los análisis realizados en los estudios e incluso mejorarlos. Un buen ejemplo de esto es el proyecto implementado en el desarrollo de Anvi'o (http://merenlab.org/software/anvio/network/), el artículo “A new genomic blueprint of the human gut microbiota” cuyo código está disponible en https://github.com/Finn-Lab/MGS-gut o el artículo "Phylogenomics of 10,575 genomes reveals evolutionary proximity between domains Bacteria and Archaea" en su pagina https://biocore.github.io/wol/. 

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

### Trabajo en servidores
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

### Ultimas recomendaciones 
Una de las cosas que mas se hace en bioinformática es buscar respuestas en foros. Los foros mas comunes suelen ser GitHub, BioStars, Researchgate, Stackoverflow, Reddit, etc. Prácticamente cualquier búsqueda que realices seguirá las siguientes sintaxis: (1) What is …; (2) How to …; (3) Tool for …; por ejemplo: What is a kmer?, How to merge two tables in one?, Tools for genome annotation.

Finalmente, para poder descargar, instalar y ejecutar la gran mayoría del software en bioinformática es necesario contar con sistemas operativos Linux montados en servidores. Si bien puedes montar un sistema operativo Linux en tu equipo personal para varias tareas, dependiendo de la cantidad de datos que manejes y el procedimiento que vayas a realizar, los equipos domésticos se quedan cortos en sus recursos. Para ello es recomendable que tengas acceso a servidores o equipos con muy buen hardware, lo cual implica mucho dinero. Sin embargo, existen plataformas que ofrecen capacidad de computo para que los investigadores realicen sus proyectos aun sin tener tales recursos. Te recomiendo mucho usar **KBase (https://kbase.us/; la que más recomiendo)** o Galaxy (https://usegalaxy.org/), ambas son plataformas en donde puedes utilizar infinidad de programas y además incluyen interfaces graficas muy amigables para quienes no están acostumbrados a líneas de comandos. También hay algunos programas que ofrecen una versión online de su software, por lo que te recomiendo buscar varias herramientas online. 

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

Como las maquinas interpretan el código?
https://www.youtube.com/watch?v=QXjU9qTsYCc


![1](https://user-images.githubusercontent.com/51969194/68170108-1b206180-ff34-11e9-8f7d-0fe1dc27301f.png)
**De ahora en adelante el símbolo “>” al inicio de la linea representa el despliegue de la información de la terminal. El simbolo "#" representa comentarios. Además, antes de ejecutar cualquier programa deveras consultar el menú de ayuda (-h) o el manual para conocer los parámetros que se emplean**

Ubica tu posición en el servidor y crea nuevos directorios
```bash
pwd 
> /home/user/
mkdir database reads assemble binnining rna_predition annotation mapping anvio
```

Asumimos que los seis metagenomas están en el directorio databases 
```bash
cd database && ls -lh 
> total 213G
-rwxrwxr-x 1 user user  15G Aug 30  2018 A04_MIL_1_R1.fastq
-rwxrwxr-x 1 user user  15G Aug 30  2018 A04_MIL_1_R2.fastq
-rwxrwxr-x 1 user user 8.6G Aug 30  2018 A04_MIN_2_R1.fastq
-rwxrwxr-x 1 user user 8.6G Aug 30  2018 A04_MIN_2_R2.fastq
-rwxrwxr-x 1 user user 26G Aug 30  2018 A04_SED_1_R1.fastq
-rwxrwxr-x 1 user user  26G Aug 30  2018 A04_SED_1_R2.fastq
-rwxrwxr-x 1 user user 8.0G Aug 30  2018 D18_MAX_1_R1.fastq
-rwxrwxr-x 1 user user 8.0G Aug 30  2018 D18_MAX_1_R2.fastq
-rwxrwxr-x 1 user user  29G Aug 30  2018 D18_SED_1_R1.fastq
-rwxrwxr-x 1 user user  29G Aug 30  2018 D18_SED_1_R2.fastq
-rwxrwxr-x 1 user user  22G Aug 30  2018 E03_SED010_1_R1.fastq
-rwxrwxr-x 1 user user  22G Aug 30  2018 E03_SED010_1_R2.fastq
```

Evalúa la calidad de los reads usando stats.pl. “basic_stats_out.txt” contiene la información de la calidad de las secuencias.  
```bash 
cd ../reads 
ls ../database/*R1* > r1_reads.txt && ls ../database/*R2* > r2_reads.txt
paste r1_reads.txt r2_reads.txt > reads_list.txt  && rm r1_reads.txt r2_reads.txt
cp ../scripts /stats.pl . 
stats.pl reads_list.txt 

ls 
> basic_stats_out.txt reads_list.txt stats.pl
```

Evalúa la calidad de los reads usando FastQC.El directorio “FastQC_results” contiene los reportes de calidad (en formato .zip y .html) para los reads paired-end (R1 y R2) de cada uno de los seis metagenomas.
```bash 
fastqc ../database/* -o /home/user/reads/FastQC_results
```

Identifica la taxonomía de los reads con Kraken2 usando la base de datos nt. Solo se ejemplifica el metagenoma A04MIL
```bash 
mkdir kraken2 && cd kraken2
mkdir A04MIL A04SED D18SED A04MIN D18MAX E03SED
cd A04MIL
kraken2 --db /home/kraken2/nt_DB/ --threads 20 --report A04MIL.report --use-names --paired /home/user/database/A04_MIL_1_R1.fastq /home/user/database/A04_MIL_1_R2.fastq 2> A04MIL.out

# /home/kraken2/nt_DB/ es la base de datos nt "Krakenizada". Los usuarios pueden construir sus propias bases de datos. Consulta el manual de Kraken2.  
```
Todos los archivos .report generados con Kraken2 contienen los reportes de la taxonomía y abundancia de los reads. Estos archivos puedes visualizarlos en el servidor de Pavian (https://fbreitwieser.shinyapps.io/pavian/) . Considera que el servidor ofrece un límite de tamaño a procesar y de excederlo hay que ejecutar Pavian de forma local, por lo que tendrás que instalarlo en Rstudio y modificar los parámetros para aumentar el tamaño de los archivos de entrada (https://github.com/fbreitwieser/pavian).  


![2](https://user-images.githubusercontent.com/51969194/68170109-1b206180-ff34-11e9-8b28-9d6ae64a2951.png)
### Ensamble y coensamble
Crea directorios para los metagenomas y ensambla los reads. Solo se ejemplifica como realizar el ensamble con Megahit (con sus tres presets) e IDBA-UD para el metagenoma A04MIL. Para el resto hay que modificar las rutas a los archivos.  
```bash
cd ../assemble
mkdir A04MIL  A04SED D18SED A04MIN  D18MAX  E03SED #En ambos directorios (idba_ud y megahit)
cd megahit/
cd A04MIL

# Con Megahit
megahit -t 50 -1 ../../database/A04_MIL_1_R1.fastq -2 ../../database/A04_MIL_1_R2.fastq -o A04MIL_megahit_meta
megahit --presets meta-large -t 50 -1 ../../database/A04_MIL_1_R1.fastq -2 ../../database/A04_MIL_1_R2.fastq -o A04MIL_megahit_large
megahit --presets meta-sensitive -t 50 -1 ../../database/A04_MIL_1_R1.fastq -2 ../../database/A04_MIL_1_R2.fastq -o A04MIL_megahit_sensitive

# Con IDBA-UD. IDBA necesita de un preprocesamiento de los reads para ensamblarlos. Además, por defecto esta configurado para solo aceptar reads <100pb. Esta limitante puede configurarse modificando el parámetro “kMaxShortSequence” dentro del script short_sequence.h de la paquetería de IDBA-UD. Para más detalles consulta el manual. 
fq2fa --merge ../../database/A04_MIL_1_R1.fastq ../../database/A04_MIL_1_R2.fastq A04MIL_reads_idba_input.fa
idba_ud -r A04MIL_reads_idba_input.fa -o A04MI_idba
```

Para ambos ensambladores, el parámetro “-o” declara el nombre de los directorios donde se imprimen los resultados. Ambos están basados en Gráficos de Brujin e iteran las longitudes de kmers, realizando contigs basados en diferentes longitudes de kmers para finalmente optimizar los resultados al final. Dentro del directorio de resultados de Megahit se crea un directorio llamado “intermediate_contigs”, el cual contiene los ensambles para cada longitud de kmer. Es bastante recomendable eliminar este directorio debido a que almacena bastante información (en GB) que no es realmente útil para nuestros fines al menos que se quiera analizar a detalle el ensamble. El archivo con los contigs que nos debe importar es “final.contigs.fa” el cual se construye a partir de la optimización de los contigs dentro del directorio intermediate_contigs. De forma similar, en IDBA el único archivo que nos importa es “contig.fa” el cual contiene los contigs optimizados. Es recomendable no eliminar los archivos con información del proceso (logs). En total por cada metagenoma se deben tener cuatro archivos fasta con los contigs los cuales se deberán renombrar de acuerdo con su procedencia, por ejemplo:
> A04MIL_megahit_meta.fa     A04MIL_megahit_large.fa    A04MIL_megahit_sensitive.fa    A04MIL_idba.fa. 

Para los siguientes procedimientos (específicamente, el coensamble con Minimus2) es necesario renombrar los encabezados de cada uno de los contigs para cada archivo fasta. 24 archivos en total (6 metagenomas x 4 archivos fasta). 
```bash
cd ../  && pwd 
> /home/user/assemble/

mkdir renamed_contigs && cd renamed_contigs # Directorio con ligas simbólicas a todos los fasta 
ln -s ../A04MIL/A04MIL_megahit_meta/A04MIL_megahit_large.fa . # Hacerlo para cada uno de los 24 archivos.  

ls *.fa > contigs_list.txt
while read line; do (sed 's/>/>'$line'_contig/g' $line > $line_mod.fa); done <lista_fasta.txt


#De esta forma para cada archivo fasta enlistado dentro de  “contigs_list.txt” se registra el encabezado de cada uno de los contigs, si inicia con “>” se sustituye por el nombre del archivo fasta del que se está leyendo (por ejemplo, A04MIL_megahit_large.fa) y todos estos contigs renombrados se almacenan en archivos con terminación “_mod.fa” (por ejemplo, A04MIL_megahit_large.fa_mod.fa).  Tal vez no sea la mejor forma de realizar esta tarea, pero funciona. Asi, pasamos a gener encabezados de este tipo:
>k93_32 flag=1 multi=3.0000 len=298
CCTTTAAGCCACCTCCCGCTTT...

# A este otro:
>A04MIL_megahit_large.fa_k93_32 flag=1 multi=3.0000 len=298
CCTTTAAGCCACCTCCCGCTTT...
```

Ordena los contigs con los encabezados renombrados de acuerdo con su procedencia (agua o sedimentos) y combina los archivos de acuerdo a su procedencia (Megahit o IDBA). Evalúa la calidad del ensamble usando Quast. “primary_contigs_stats_by_quast” es el directorio donde se encuentran los reportes estadísticos de los ensambles.   
```bash
mkdir water sediments
mv *A04MIL* *A04MIN* *D18MAX* water
mv *SED* sediments

cd water
cat *meta* > water_meta_primary_contigs.fa
cat *large* > water_large_primary_contigs.fa
cat *sensitive* > water_sensitive_primary_contigs.fa
cat *idba* > water_idba_primary_contigs.fa
quast.py -o primary_contigs_stats_by_quast -m 0 -t 20 *primary*

cd ../sediments
cat *meta* > sediments_meta_primary_contigs.fa
cat *large* > sediments_large_primary_contigs.fa
cat *sensitive* > sediments_sensitive_primary_contigs.fa
cat *idba* > sediments_idba_primary_contigs.fa
quast.py -o primary_contigs_stats_by_quast -m 0 -t 20 *primary*
```

Con estos metagenomas, Megahit --present-sensitive tuvo un mejor rendimiento y por ello se trabaja con tales contigs. Crea directorios y ligas simbólicas para realizar el coensamble con Minimus2. 

```bash
cd && pwd 
> /home/usuario
mkdir assemble/coassemble
cd assemble/coassemble
ln -s ../assemble/water/water_sensitive_primary_contigs.fa . 
ln -s ../assemble/sediments/sediments_sensitive_primary_contigs.fa .
mkdir water sediments
mv *sed* sediments && mv *water* water
cd water 

# Preprocesamiento para coensamblar los contigs
toAmos -s water_sensitive_primary_contigs.fa -o water_sensitive_primary_contigs_input_2_minimus2.afg
minimus2 water_sensitive_primary_contigs_input_2_minimus2.afg -D OVERLAP=100 MINID=95

# Minimus2 genera varios resultados, los que nos interesa combinar son los contigs coensamblados (.fasta) y los singletones (.singletons.seq)
cat *input_2_minimus2.fasta *input_2_minimus2.singletons.seq > water_secondary_contigs.fa  
# Hacer lo propio para los contigs de sedimentos para generar un archivo sediment_secondary_contigs.fa
```

### Binning
Realiza el mapeo de los contigs a los reads para generar las coberturas con Bowtie2  
```bash
cd /home/user/mapping
mkdir water sediments
ln -s /home/assemble/coassemble/water/water_secondary_contigs.fa  water/
ln -s /home/assemble/coassemble/sediments/sediment_secondary_contigs.fa sediments
cd water 

bowtie2-build *secondary_contigs.fa water_secondary_contigs_index # Preprocesamiento (indexar)
bowtie2 -x /home/user/mapping/water/water_secondary_contigs_index --very-sensitive --end-to-end --no-unal -q --threads 20 -1 /home/user/database/A04_MIL_1_R1.fastq,/home/user/database/A04_MIN_2_R1.fastq,/home/user/database/D18_MAX_1_R1.fastq -2 /home/user/database/A04_MIL_1_R2.fastq,/home/user/database/A04_MIN_2_R2.fastq,/home/user/database/D18_MAX_1_R2.fastq -S water_RAW.sam; # Mapea los contigs contra los metagenomas
samtools view -Sb water_RAW.sam -o water_RAW.bam # Comprime el SAM
samtools sort -o water_SORTED.bam water_RAW.bam # Ordena el BAM
rm *RAW*
# Realiza lo propio para los sedimentos 
```

Filtra el numero de contigs y realiza el binning
```bash
cd binning 
mkdir water sediments && cd water 
ln -s /home/user/mapping/water/water_SORTED.bam . 
cat /home/assemble/coassemble/water/water_secondary_contigs.fa |  megahit_toolkit filterbylen 2000 > water_secondary_contigs_2k.fa

# Define como variables: los valores del parámetro de preferencia (-p) de Binsanity (1) y Binsanity-refine (2); el archivo BAM (3); los contigs a someter a binning (4); Número de núcleos a emplear (5).
P1=-10; P2=-5; P3=-3; P4=-3; P5=-3; P6=-3; # 1
R1=-25; R2=-25; R3=-25; R4=-25; R5=-25; R6=-10; R7=-3; # 2
bam_file=water_SORTED.bam; # 3
fasta_file=water_secondary_contigs_2k.fa; # 4
NUCLEOS=20 # 5;

# Genera los perfiles de cobertura y normaliza
get-ids -f . -l $fasta_file -o contigs_IDs.txt;
Binsanity-profile -i $fasta_file -s . --ids contigs_IDs.txt --transform scale -T $NUCLEOS -c contigs_coverage_profile;
mkdir binsanity_profile_outs
mv *readcounts* *saf* binsanity_profile_outs;

##################### Binning 1
Binsanity -f . -l $fasta_file -c *lognorm* -p $P1 -m 4000  -v 400 -d 0.95 --log PASS1-log.txt -o PASS1;
cd PASS1 && find . -size 0 -delete;
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS1-%u" $num).fna";
       num=$(($num+1));
done
checkm lineage_wf -x fna -t $NUCLEOS . PASS1-checkm > PASS1-checkm_out;
checkm_analysis -checkM PASS1-checkm_out;
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
ls -lh  * > renamed_merged_bins_info.txt
cd high_redundancy
find . -size 0 -delete

##################### Refinamiento 1
for file in *.fna; do
        Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R1 --log PASS1-refine-log.txt -o ../../PASS1-refine;
done
cd ../../PASS1-refine && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS1-refine-%u" $num).fna"
       num=$(($num+1));
done
checkm lineage_wf -x fna -t $NUCLEOS .  PASS1-refine-checkm > PASS1-refine-checkm_out;
checkm_analysis -checkM PASS1-refine-checkm_out
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete

##################### Binning 2
for file in *.fna; do
        Binsanity -f . -l "$file" -c ../../*lognorm* -p $P2 -m 4000 -v 400 -d 0.95 --log PASS2-log.txt -o ../../PASS2;
done
cd ../../PASS2 && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS2-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete

##################### Refinamiento 2
for file in *.fna; do
       Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R2 --log PASS2-refine-log.txt -o ../../PASS2-refine;
done
cd ../../PASS2-refine && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS2-refine-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Binning 3
for file in *.fna; do
       Binsanity -f . -l "$file" -c ../../*lognorm* -p $P3 -m 4000 -v 400 -d 0.95 --log PASS3-log.txt -o ../../PASS3;
done
cd ../../PASS3 && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS3-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Refinamiento 3
for file in *.fna; do
        Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R3 --log PASS3-refine-log.txt -o ../../PASS3-refine;
done
cd ../../PASS3-refine && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS3-refine-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Binning 4
for file in *.fna; do
       Binsanity -f . -l "$file" -c ../../*lognorm* -p $P4 -m 4000 -v 400 -d 0.95 --log PASS4-log.txt -o ../../PASS4;
done
cd ../../PASS4 && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS4-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Refinamiento 4
for file in *.fna; do
        Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R4 --log PASS4-refine-log.txt -o ../../PASS4-refine;
done
cd ../../PASS4-refine && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS4-refine-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete

##################### Binning 5
for file in *.fna; do
        Binsanity -f . -l "$file" -c ../../*lognorm* -p $P5 -m 4000 -v 400 -d 0.95 --log PASS5-log.txt -o ../../PASS5;
done
cd ../../PASS5 && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS5-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Refinamiento 5
for file in *.fna; do
        python2.7 /usr/local/bin/Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R5 --log PASS5-refine-log.txt -o ../../PASS5-refine;
done
cd ../../PASS5-refine && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS5-refine-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete

##################### Binning 6
for file in *.fna; do
        Binsanity -f . -l "$file" -c ../../*lognorm* -p $P6 -m 4000 -v 400 -d 0.95 --log PASS6-log.txt -o ../../PASS6;
done
cd ../../PASS6
find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS6-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >> high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Refinamiento 6
for file in *.fna; do
       Binsanity-refine -c ../../*lognorm -f . -l "$file" -p $R6 --log PASS6-refine-redundant-pref10-log.txt -o ../../PASS6-refine-redundant-pref10;
done
cd ../../PASS6-refine-redundant-pref10 && find . -size 0 -delete
num=1; for file in *.fna; do
       mv "$file" "$(printf "PASS6-refine-redundant-%u" $num).fna"
       num=$(($num+1));
done
for file in low_completion/*.fna; do
        cat "$file" >>high_redundancy/low_completion.fna;
done
mv strain*/*.fna high_redundancy
cd high_redundancy
find . -size 0 -delete


##################### Refinamiento 7
for file in *.fna ; do
        Binsanity-refine -f . -l "$file" -p $R7 -c ../../*lognorm --log PASS6-refine-redundant-2-pref3-log.txt -o ../../PASS6-refine-2-redundant-pref3;
done
cd ../../PASS6-refine-2-redundant-pref3
num=1;  for file in *.fna; do
        mv "$file" "$(printf "PASS6-refine-redundant-2-%u" $num).fna"
        num=$(($num+1));
done
cd ../

##################### Directorios finales
mkdir FINAL-HIGH-COMPLETION FINAL-LOW-COMPLETION FINAL-HIGH-REDUNDANCY
# For Hi-C bins
cp PASS*/high_completion/*.fna FINAL-HIGH-COMPLETION
# For Low-C bins
cp PASS6-refine-redundant-pref10/low_completion/*.fna FINAL-LOW-COMPLETION/
cp PASS6-refine-2-redundant-pref3/low_completion/*.fna FINAL-LOW-COMPLETION/
# For H-Red bins
cp PASS6-refine-2-redundant-pref3/high_redundancy/*.fna FINAL-HIGH-REDUNDANCY/

cd FINAL-HIGH-COMPLETION
checkm lineage_wf -x fna -t $NUCLEOS . high_completion-checkm > high_completion-checkm_out

cd ../FINAL-LOW-COMPLETION
checkm lineage_wf -x fna -t $NUCLEOS . low_completion-checkm > low_completion-checkm_out

cd ../FINAL-HIGH-REDUNDANCY
checkm lineage_wf -x fna -t $NUCLEOS . high-redundancy-checkm > high-redundancy-checkm_out


```


![3](https://user-images.githubusercontent.com/51969194/68170106-1a87cb00-ff34-11e9-8cc8-003459b94f6f.png)

### Predicción de RNAs (sRNA y tRNA)  

5S sRNA
Family: 5S_rRNA (RF00001) 

16S sRNA
Family: LSU_rRNA_bacteria (RF02541)
Family: LSU_rRNA_archaea (RF02540)

23S sRNA
Family: SSU_rRNA_bacteria (RF00177)
Family: SSU_rRNA_archaea (RF01959)

Clasifica los MAGs de acuerdo con su fracción de procedentica (sedimentos o agua) y dominio (bacteria o arquea) en sus respectivos directorios y ejecuta los scripts escritos por Alexandre Almeida.  

```bash
# Para genomas de arqueas
for file in *.fna; do
  RNA_detect_archaea.sh  $file
done
mkdir  sRNAs tRNAs  sRNAs/sequences
mv *_tRNA_20aa.out tRNAs
mv *_rRNAs.out sRNAs
mv *_rRNAs.fasta sRNAs/sequences
cd tRNAs
cat *20aa.out >> all_MAGs_tRNAs.txt
cd ../sRNAs
cat *rRNAs.out >> all_MAGs_sRNAs.txt
cd ../

# Para genomas de bacterias
for file in *.fna; do
  RNA_detect_bacteria.sh  $file
done
mkdir  sRNAs tRNAs  sRNAs/sequences
mv *_tRNA_20aa.out tRNAs
mv *_rRNAs.out sRNAs
mv *_rRNAs.fasta sRNAs/sequences
cd tRNAs
cat *20aa.out >> all_MAGs_tRNAs.txt
cd ../sRNAs
cat *rRNAs.out >> all_MAGs_sRNAs.txt
cd ../
```

### Clasificación taxonómica 
```bash
gtdbtk classify_wf --genome_dir all_MAGs/ --out_dir GTDB_Taxonomy_classWF --cpus 25

only MAGs 
GToTree -f my_28_MAG.txt -H /home/install/GToTree-1.4.2/hmm_sets/Bacteria_and_Archaea.hmm -N -j 20 -n 4 -o ONLY_MAGs

GToTree -f my_10_MAG_SELECTED.txt -a MAG_ref_accessions.txt -H /home/install/GToTree-1.4.2/hmm_sets/Bacteria_and_Archaea.hmm -p pfam_accesions.txt -j 20 -n 4 -t -L Domain\,Phylum\,Class\,Species -o FINAL_TREE

.tre -> iTol 
https://gtdb.ecogenomic.org/ 
https://itol.embl.de/

```

### Cobertura en los metagenomas y anotación 

Evalúa la cobertura de los MAGs con Anvi’o utilizando el pipeline metagenómico 
anvi-run-workflow -w metagenomics -c config.json 

config.json
```bash
{
    "samples_txt": "samples.txt",
    "fasta_txt": "fasta.txt",
    "references_mode": true,
    "import_percent_of_reads_mapped": {
        "run": false
    },
    "bowtie": {
        "additional_params": "--no-unal",
        "threads": 4
    },
    "anvi_profile": {
        "--overwrite-output-destinations": true,
        "--min-contig-length": 0,
        "--profile-SCVs": true,
        "--skip-SNV-profiling": false,
        "threads": 4
    },
    "anvi_script_reformat_fasta": {
        "run": true
    },
    "anvi_run_ncbi_cogs": {
        "run": true,
        "threads": 15
    },
    "output_dirs": {
        "FASTA_DIR": "02_FASTA",
        "LOGS_DIR": "00_LOGS",
        "QC_DIR": "01_QC",
        "PROFILE_DIR": "05_ANVIO_PROFILE",
        "MERGE_DIR": "06_MERGED",
        "MAPPING_DIR": "04_MAPPING",
        "CONTIGS_DIR": "03_CONTIGS"
    },
    "anvi_run_hmms": {
        "run": false
    },
    "iu_filter_quality_minoche": {
        "run": false
    },
    "anvi_merge": {
        "--skip-concoct-binning": true
    }
}
```

fasta.txt
```bash
reference       path
PASS1_11        /dos/gama/tesis_lic_gama/mapping/anvio/PASS1_11.fa
PASS1_refine_69 /dos/gama/tesis_lic_gama/mapping/anvio/PASS1_refine_69.fa
PASS1_refine_95 /dos/gama/tesis_lic_gama/mapping/anvio/PASS1_refine_95.fa
PASS1_refine_97 /dos/gama/tesis_lic_gama/mapping/anvio/PASS1_refine_97.fa
PASS1_refine_98 /dos/gama/tesis_lic_gama/mapping/anvio/PASS1_refine_98.fa
```
samples.txt
```bash
sample  r1      r2
A04_MIL /home/samples/CIGoM/A04_MIL_1_R1.fastq  /home/samples/CIGoM/A04_MIL_1_R2.fastq
A04_MIN /home/samples/CIGoM/A04_MIN_2_R1.fastq  /home/samples/CIGoM/A04_MIN_2_R2.fastq
D18_MAX /home/samples/CIGoM/D18_MAX_1_R1.fastq  /home/samples/CIGoM/D18_MAX_1_R2.fastq
```

Exporta las secuencias de aminoácidos de los MAGs con Anvi’o para que las anotaciones sean compatibles  
```bash
anvi-get-sequences-for-gene-calls -c  03_CONTIGS/PASS1_11-contigs.db --get-aa-sequences -o PASS1_11_protein.fa

# Enviar los MAGs al servidor de GhostKOALA con la base de datos genus_prokaryotes https://www.kegg.jp/ghostkoala/
head KEGG_PASS1-11.txt
genecall_0
genecall_1      K00338
genecall_2      K00337
genecall_3      K00333
genecall_4      K00332
genecall_5      K00331


# Importa a anvio
KEGG-to-anvio --KeggDB ~gama/bin/GhostKoalaParser/samples/KO_Orthology_ko00001.txt -i ../KEGG_PASS1-11.txt -o KEGG_PASS1-11_AnviImportable.txt
anvi-import-functions -c ../../03_CONTIGS/PASS1_11-contigs.db -i KEGG_PASS1-11_AnviImportable.txt

# Pfam annotation 
for file in 03_CONTIGS/*.db; do
  anvi-run-pfams -c $file --pfam-data-dir /Database/Anvio/pfam -T 20
 done 

### KEHH decoder heatmap 
KEGG-decoder -i ../inputs/KEGG_PASS1-11.txt -o FUNCTION_OUT_PASS1-11.list -v static
mv function_heatmap.svg decoder_PASS1-11.svg

KEGG-decoder  -i KEGG_PASS1-11.txt -o KEGG_PASS1-11_function.list -v static
mv function_heatmap.svg  PASS1-11.svg

hmmsearch --tblout PASS1_11_expanderv0.3.tbl -T 75 ~gama/bin/BioData/KEGGDecoder/HMM_Models/expander_dbv0.6.hmm ../../MAG_genes/PASS1_11-contigs.db_genes.fa

Decode_and_Expand.py ../decoder/FUNCTION_OUT_PASS1-11.list ../expand/HMM_OUT_PASS1_11.list
 mv decode-expand_heatmap.svg decode-expand_heatmap_PASS1_11.svg
 
 anvi-interactive -p 06_MERGED/PASS1_refine_97/PROFILE.db -c 03_CONTIGS/PASS1_refine_97-contigs.db
```







