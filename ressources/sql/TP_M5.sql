/*1
 */
select
left (cpo, 2),
count(left (cpo, 2))
from
clients
group by
left (cpo, 2)
order by
count(left (cpo, 2)) DESC;
/*2 (jsp afficher le nom associer)
 */
select
nom,
prenom,
fiches.noCli,
count(fiches.noCli),
fiches.noFic
from
fiches
inner join clients as c on c.noCli = fiches.noCli
group by
nom,
prenom,
fiches.noCli,
fiches.noFic
having
count(fiches.noCli) != 1;
/*3
 */
select
top 10 refart,
count(refart)
from
lignesFic
group by
refart
order by
count(refart) desc;
/*4
 */
select
codeCate,
sum(noLig)
from
lignesFic as f
inner join articles as a on f.refart = a.refart
group by
codeCate;
/*5*/
 
With
    paniers as (
        select
            f.noFic,
            -- IIF( lf.retour = NULL,sum(t.prixJour * datediff(day,lf.depart, 
            -- GETDATE())), sum(t.prixJour * datediff(day,lf.depart, lf.retour))) as panier
            sum(
                t.prixJour * (
                    datediff (day, lf.depart, coalesce(lf.retour, GETDATE ())) + 1
                )
            ) as panier
        from
            fiches as f
            inner join clients as c on f.noCli = c.noCli
            inner join lignesFic as lf on f.noFic = lf.noFic
            inner join articles as a on lf.refart = a.refart
            inner join grilleTarifs as gt on a.codeCate = gt.codeCate
            inner join tarifs as t on gt.codeTarif = t.codeTarif
        group by
            f.noFic
    )
select
    format (avg(p.panier), 'N2')
from
    paniers as p;

/*6
 */
select
lf.noFic,
count(DISTINCT lf.refart) as nbRefart
from
lignesFic as lf
inner join fiches as f on lf.noFic = f.noFic
inner join clients as c on f.noCli = c.noCli
group by 
lf.noFic
having count(DISTINCT lf.refart) > 1
order by lf.noFic ASC;
/*7
 */
select 
f.*,
c.nom,
c.prenom
from 
fiches as f
inner join clients as c on f.noCli = c.noCli
where f.etat <> 'SO';
/*8
*/
select 
lf.*
from
lignesFic as lf
where 
lf.retour IS NULL;