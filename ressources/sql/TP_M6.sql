/*1
INSERT INTO clients VALUES(47, 'Billy', 'Lenfant', '3 route de villiers', '53170', 'Saint charles la fôret', 47);
 */
/*2
WITH
    nclient AS (
        select
            MAX(noCli) AS parrain
        FROM
            clients
    )
UPDATE c
SET
    c.idClientParrain = (
        select
            MAX(noCli) AS parrain
        FROM
            clients
    )
FROM
    clients c
where
    c.noCli <> (
        select
            MAX(noCli) AS parrain
        FROM
            clients
    )
 */

/*3
DELETE 
from clients
where noCli = 14;
*/

/*4
CREATE view cour_de_loc as
select 
    a.designation, 
    lf.depart
from
    lignesFic as lf
    inner join articles as a on lf.refart = a.refart
where 
    datediff(day,lf.depart, getdate()) <= 7
    and lf.retour IS NULL;
*/