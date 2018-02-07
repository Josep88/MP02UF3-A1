### Escriu les sentències SQL per tal d’obtenir els que se’ns demana. A més a més si creus que la sentència es pot millorar amb la incorporació d’un índex i/o modificació de l’esquema (sense alterar-ne el comportament),etc... Afegeix la sentència DDL i l’output de EXPLAIN mostrant la millora (EXPLAIN sense índex i EXPLAIN amb índex). Si creus que la consulta no es pot millorar mitjançant índexs justifica el perquè. ( 2 punts )
  
#### 1. Obtenir el nom i l’adreça dels hotels de 4 estrelles.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/01.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/010.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/06i.PNG)  
Reaprofito un índex que crearé pel exercici 6.  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/012.PNG)  
***  
#### 2. Obtenir el nom dels clients (Nom i cognom) que el seu cognom comenci per vocal (sense tenir en compte els accents).  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/02.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/020.PNG)  
  
No es pot millorar amb índexs ja que esta utilitzant un expressió regular per analitzar els cognoms.
***  
#### 3. Quina és la reserva_id que té més nits. Indica també la quantitat de nits.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/03.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/030.PNG)  
  
No es pot indexar ja que s'està utilitzant una funció DATEDIFF per treure el valor a comparar i necesita comprovar tots els casos.  
***  
#### 4. Quantes reserves va rebre l’hotel ‘Catalonia Ramblas’ de Barcelona durant tot  l’any 2015 (una reserva pertany al 2015 si alguna nit d’aquesta reserva era del 2015).  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/04.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/040.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/04i.PNG)  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/041.PNG)  
***  
#### 5. Obtenir el nom i cognoms dels clients que varen néixer el mes de Març.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/05.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/050.PNG)  
  
No es pot indexar ja que s'està utilitzant una funció MONTH per treure el valor a comparar i necesita comprovar tots els casos.  
***  
#### 6. Quantitat d’hotels de 4 estrelles de la població de Barcelona.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/06.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/060.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/06i.PNG)  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/061.PNG)  
***  
#### 7. De l’any 2015 volem obtenir els seu histograma de reserves. És a dir volem saber el número de reserves de cadascun dels mesos. Una reserva pertany a un mes si la alguna nit d’aquella reserva cau a dins de l’any 2015.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/07a.PNG)  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/07b.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/070.PNG)  
  
No es pot indexar ja que s'està utilitzant les funcions YEAR i MONTH i necesita comparar tots els camps.
***  
#### 8. El nom dels hotels que tenen com a mínim una habitació lliure durant les dates ‘2015-05-01’ i ‘2015-05-17’.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/08.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/080.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/08i.PNG)  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/082.PNG)  
***  
#### 9. Obtenir la quantitat de reserves que s’inicien en cadascun dels dies de la setmana. Tenint en compte només l’any 2016.   
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/09.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/090.PNG)  
  
No es pot indexar ja que s'està utilitzant la funció DAYOFWEEK i un ORDER BY, per tant necesita comparar tots els camps.  
***  
#### 10. Durant 2014 qui va realitzar més reserves? Els homes o les dones? Mostra el sexe i el número de reserves.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/10.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/100.PNG)  
  
No es pot indexar, ja agafa la clau forana com a filtre i no treure'n més.  
***  
#### 11. Quina és la mitjana de dies de reserva per l’hotel «HTOP Royal Star» de Blanes durant l’any 2016? (Una reserva pertany el 2016 si alguna nit cau en aquest any).  
***  
#### 12. El nom, categoria, adreça i número d’habitacions de l’hotel amb més habitacions de la BD.  
***  
#### 13. Rànquing de 5 països amb més reserves durant l’any 2016. Per cada país mostrar el nom del país i el número de reserves.  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/13.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/130.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/13i.PNG)  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/131.PNG)  
***  
#### 14. Codi client, Nom, Cognom, del client que ha realitzat més reserves de tota la BD.  
***  
#### 15. Codi client, Nom, Cognom, del client que ha realitzat més reserves durant el mes d’agost de l’any 2016. Les reserves a comptabilitzar són totes aquelles que en algun dia del seu període cau en el mes d’agost.  
***  
#### 16. Quin és el país que en tenim menys clients?  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/16.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/160.PNG)  
  
No es pot indexar, la subconsulta més baixa ja filtra per la clau forana, la superior selecciona sobre aquesta subconsulta i la consulta superior ja filtra per mitja de la clau forana també.  
***  
#### 17. Quina és la mitjana de nits dels clients provinents d’‘HOLANDA’ per l’any 2016?  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/17.PNG)  
  
EXPLAIN sense índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/170.PNG)  
  
ÍNDEX:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/13i.PNG)  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/17i.PNG)  
  
EXPLAIN amb índex:  
>  ![1](https://raw.githubusercontent.com/Josep88/MP02UF3-A1/master/img/exercici1/171.PNG)  
***  
#### 18. Digues el nom i cognoms dels clients que el seu cognom sigui ‘Bahi’.  
***  
#### 19. Quins clients (nom, cognoms) segueixen el patró de que el seu cognom comenci per la lletra ‘p’  i seguida d’una vocal.  
***  
#### 20. Quin és l’hotel de 4 estrelles amb més reserves durant tot el 2015 ( una reserva pertany el 2015 si alguna de les nits hi pertany).  
***  
#### 21. Quin és l’hotel amb més reserves (tota la BD).  
***  
#### 22. Quin és el país amb més reserves? (tots els anys) O sigui, quin és el país d’on han vingut més turistes.  
  
***
|[Inici](https://github.com/Josep88/MP02UF3-A1)|[Següent](https://github.com/Josep88/MP02UF3-A1/blob/master/Exercicis/exercici2.md)|
|:-:|:-:|
