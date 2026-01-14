/*1
*/
SELECT 
    c.noCli,
    f.noFic
FROM
    fiches as f
    inner join clients as c on f.noCli = c.noCli