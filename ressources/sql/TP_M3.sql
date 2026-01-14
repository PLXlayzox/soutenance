
/*1&2
select nom,prenom,adresse,cpo,ville from clients 
    where left(cpo,2)
    in(75,77,78,91,92,93,94,95)
*/


/*3
select noCli from fiches
    order by dateCrea DESC
    intersect
    select noCli from clients
    where nom = 'Dupond' and prenom = 'Jean'
*/

/*4
select * from fiches
     where etat = 'EC'
*/

/*5
select * from articles 
    where designation like'%d%'
*/

/*6
select nom from clients
    where nom like'[A-J]%'
*/

/*7
select * from fiches
    where datepart(year,dateCrea) = 2024 and datepart(month,dateCrea) = 6 
*/

/*8 
select *, 
CASE etat
WHEN 'SO' THEN 'Sold�e'
WHEN 'EC' THEN ' En cours'
WHEN 'RE' THEN 'Rendu'
END AS statut
from fiches
*/

/*9 (il faut que les 2 select ont les mm param)
select * from gammes
    where codeGam = 'EG'
    union
    select * from categories
    where codeCate = 'FOP'
*/

/*10
select * from gammes
    where codeGam = 'PR'
select * from categories
    where codeCate = 'FOA'
*/

/*11
select * from fiches
*/

/*12 
select * from fiches
    where DATEDIFF(day, dateCrea, getdate()) < 7
*/

/*13
select count(*) from clients
*/