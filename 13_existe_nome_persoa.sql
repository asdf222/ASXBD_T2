DELIMITER $$
DROP FUNCTION IF EXISTS existe_nome $$
CREATE FUNCTION existe_nome(nome_parametro VARCHAR(30))
	RETURNS TINYINT
BEGIN
	DECLARE resultado TINYINT;
	IF (SELECT 1 FROM persoa WHERE nome = nome_parametro LIMIT 1) = 1
		THEN
			SET resultado = 1;
		ELSE
			SET resultado = 0;
	END IF;
	RETURN(resultado);
END $$
DELIMITER ;

