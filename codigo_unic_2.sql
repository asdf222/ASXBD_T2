CREATE database if not exists probas;
USE probas if exists;
CREATE table if not exists persoa(persoa_id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(30), apelido VARCHAR(30), nif CHAR(9));

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
DELIMITER $$
DROP PROCEDURE IF EXISTS alta_unica $$
CREATE PROCEDURE alta_unica(nome_p VARCHAR(30), apelido_p VARCHAR(30), nif_p CHAR(9))
BEGIN
		IF (SELECT 1 FROM persoa WHERE nif = nif_p LIMIT 1) = 1
			THEN
				SELECT "Error, este NIF xa foi rexistrado";
			ELSE
				INSERT INTO persoa(nome,apelido,nif) VALUES(nome_p, apelido_p, nif_p);
		END IF; 
END $$
DELIMITER ;