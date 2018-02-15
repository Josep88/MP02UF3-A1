### Escull 5 sentències SQL de la Part 1 (intenta que els temps d’execució siguin significatius)   
Hem escollit aquestes consultes del exercici 1: 7, 8, 13, 20 i 21.  
  
#### Quins temps d'execució t'han sortit per cada consulta?  
Habilitem PROFILING per poder veure el temps d’execució de les consultes:  
> SET profiling = 1; 
  
I executem les consultes. En acabar, feim aquesta comanda per veure els temps:  
> SHOW PROFILES;  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/1.png)  
  
| Consulta      | Temps         |
| ------------- |:-------------:|
| 7             | 1,21440075s   |
| 8             | 0,18167575s   |
| 13            | 0,381706s     |
| 20            | 0,85257225s   |
| 21            | 2,3494455s    |
  
#### Activa la Query Cache (ON)  
Afegim aquesta configuració al fitxer /etc/percona.conf.d/mysqld.cnf per activar la QUERY CACHE:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/2.png)  
query_cache_size: ajusta el tamany de la cache en bytes. 8 MB.  
query_cache_type: configura el tipus de cache a 1. En mode ON.  
  
Comprovem que ha agafat la configuració:  
query_cache_type  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/3.png)  
  
query_cache_size  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/4.png)  
  
#### Reexecuta les consultes anteriors 2 vegades seguides. Ha millorat el temps d'execució?  
| Consulta      | Temps Primera | Temps Segona |
| ------------- |:-------------:|:------------:|
| 7             | 1,21440075s   | 0,00035925s  |
| 8             | 0,18167575s   | 0,000426s    |
| 13            | 0,381706s     | 0,00026875s  |
| 20            | 0,85257225s   | 0,00041825s  |
| 21            | 2,3494455s    | 0,000187s    |
  
#### Quina modificació hem de fer perquè la consulta no passi per Cache? (reescriu una consulta amb els canvis)  
Primer comprovem que la cache està activa:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/5.png)  
  
Modifiquem una consulta con el paràmetre SQL_NO_CACHE:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/6.png)  
  
Podem comprovar que no usa la cache pel seu temps d’execució.  
  
#### Activa la Query Cache (ON DEMAND)  
Canviem  la configuració del fitxer mysqld.cnf per activar la cache ON DEMAND.  
Per això modifiquem el paràmetre query_cache_type = 2, i després reiniciem el servei de MYSQL:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/7.png)  
  
Comprovem que s’ha modificat correctament:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici2/8.png)  
  
#### Posa un exemple d'execució sota demanda.   

  
#### Quina modificació hem de fer perquè la consulta passi per Cache?(reescriu la consulta amb els canvis)  
#### Un cop acabats els punts anteriors mostra quin ha estat el teu CacheHitRatio? Com has obtingut els valors de cache_hits i cache_misses?  
#### Demostra quines sentències DML (INSERT, UPDATE, DELETE) provoquen que es buidi la cache de les taules implicades amb aquestes sentències.  
  
***
|[Anterior](https://github.com/Josep88/MP02UF3-A1/blob/master/Exercicis/exercici1.md)|[Inici](https://github.com/Josep88/MP02UF3-A1)|[Següent](https://github.com/Josep88/MP02UF3-A1/blob/master/Exercicis/exercici3.md)|
|:-:|:-:|:-:|
