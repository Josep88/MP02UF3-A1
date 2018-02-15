### Mitjançant la eina SYSBENCH prepara un joc de proves mitjançant les sentències SQL anteriors o d’altres que creguis que puguin anar bé per realitzar les proves.  
#### Documenta la instal·lació de l'eina, la creació dels scripts de prova i l’execució de les proves.  
Instal·lació:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/1install.PNG)  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/2install.PNG)  
  
I per comprovar que està instal·lat i funcionant:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/3install.PNG)  
  
Script LUA per executar el SYSBENCH. [Descarrega](https://github.com/Josep88/MP02UF3-A1/blob/master/files/test.lua):
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/1script.PNG)  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/2script.PNG)  
L’script te 4 randoms que son els encarregats de formar una SELECT aleatòria.  
En funció del primer random, despres d’aquesta primera consulta aleatòria, s’executaran les consultes dels exercicis 7 i 8 o les del 13, 20 i 21.  
  

  
#### Test 1: Treu tots els índexs de la Part 1 i desactiva la CACHE i realitza el benchmark.  
Primer test amb res activat a la base de dades:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/test1.PNG)  
  
#### Test 2: Afegeix els índexs de  la part 1  
Segon test amb els índexs activats:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/test2.PNG)  
  
#### Test 3: Activa la CACHE (també fes que les consultes passin per aquesta CACHE)  
Tercer test amb els índexs i la QUERY CACHE activada:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/test3FILES.PNG)  

I faig el test:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/test3.PNG)  
  
#### Realitza una comparativa mostrant els resultats obtinguts dels tres benchmarks.  
#### En el tercer cas indica quin ha estat el valor de CacheHitRatio.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici3/cachehitratio.PNG)  

***
|[Anterior](https://github.com/Josep88/MP02UF3-A1/blob/master/Exercicis/exercici2.md)|[Inici](https://github.com/Josep88/MP02UF3-A1)|[Següent](https://github.com/Josep88/MP02UF3-A1/blob/master/Exercicis/webgrafia.md)|
|:-:|:-:|:-:|
