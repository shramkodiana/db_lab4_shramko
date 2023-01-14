DROP PROCEDURE IF EXISTS get_country(varchar);
-- процедура, що виводить країну, в якій жив вказаний динозавр
CREATE OR REPLACE PROCEDURE get_country(country_arg varchar(250))
LANGUAGE 'plpgsql'
AS $$
DECLARE dname dinosaur.dino_name%TYPE;
DECLARE country  dinosaur.lived_in%TYPE;

BEGIN
    SELECT dinosaur.dino_name, dinosaur.lived_in INTO dname, country FROM dinosaur
		WHERE dinosaur.dino_name = country_arg;
    RAISE INFO 'Dinosaur: %,  Country, in which he lived in: %', dname, country;
END;
$$;
	