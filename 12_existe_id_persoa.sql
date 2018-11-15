DELIMITER $$
DROP FUNCTION IF EXISTS existe $$
CREATE FUNCTION existe(id int)
	RETURNS TINYINT
BEGIN
	DECLARE resultado TINYINT;
	IF (SELECT 1 FROM persoa WHERE persoa_id = id) = 1
		THEN
			SET resultado = 1;
		ELSE
			SET resultado = 0;
	END IF;
	RETURN(resultado);
END;
$$
DELIMITER ;

