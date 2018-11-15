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
