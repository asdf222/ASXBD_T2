DELIMITER $$
DROP FUNCTION IF EXISTS contar $$
CREATE FUNCTION contar()
	RETURNS INT
BEGIN
	DECLARE contar INT;
	SET contar = (SELECT COUNT(*) from persoa);	
	RETURN(contar);
END;
$$
DELIMITER ;
