/*1
select
    noFic,
    dateCrea,
    datePaye,
    etat,
    nom,
    prenom
from
    fiches,
    clients
where
    fiches.noCli = clients.noCli;
 */

/*2  manque la parte afficher « Pas de location connue »
select
    a.*,
    CASE
        WHEN lf.depart IS NULL THEN 'Pas de location connue'
        ELSE CAST(lf.depart AS nvarchar (32))
    END AS DateLocation
from
    articles AS a
    LEFT JOIN lignesFic as lf on lf.refart = a.refart;
 */

/*3
select
    designation,
    codeGam,
    codeCate,
    noFic,
    noLig,
    depart,
    retour
from
    articles,
    lignesFic
where
    articles.refart = lignesFic.refart
    and codeGam = 'PR'
    and codeCate = 'FOA';
 */

/*4
select
    designation,
    nom,
    prenom,
    cpo
from
    articles,
    fiches,
    lignesFic,
    clients
where
    fiches.noCli = clients.noCli
    and fiches.noFic = lignesFic.noFic
    and articles.refart = lignesFic.refart
    and left (cpo, 2) in (75, 77, 78, 91, 92, 93, 94, 95);
 */

/*5 marche pas 
select
    lignesFic.noFic,
    noLig,
    refart,
    depart,
    retour,
    nom,
    prenom
from
    lignesFic,
    clients,
    fiches
WHERE
    DATEDIFF (day, depart, GETDATE ()) > 7
    and fiches.noCli = clients.noCli
    and fiches.noFic = lignesFic.noFic;
 */

/*6
select
    nom,
    prenom,
    codeGam
from
    clients,
    articles,
    lignesFic,
    fiches
where
    fiches.noCli = clients.noCli
    and fiches.noFic = lignesFic.noFic
    and articles.refart = lignesFic.refart
    and codeGam != 'PR';
 */