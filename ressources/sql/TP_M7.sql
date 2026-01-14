/*1
*/
CREATE PROCEDURE fiches_loc
    @noFic NUMERIC(6),
    @noCli NUMERIC(6),
    @dateCrea DATETIME,
    @datePaye DATETIME,
    @etat CHAR(2)
AS   

    SET NOCOUNT ON;
    SELECT 
        noFic,
        noCli,
        datePaye,
        dateCrea,
        etat
    FROM 
        fiches
    WHERE 
        noFic = @noFic
        and noCli = @noCli
        and datePaye = @datePaye
        and dateCrea = @dateCrea
        and etat = @etat
GO