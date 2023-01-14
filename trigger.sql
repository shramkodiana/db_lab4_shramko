--тригер, що записує значення імені динозавра з однаковим способом харчування в верхньому регістрі
-- при додаванні новго рядка в таблицю
CREATE OR REPLACE FUNCTION upper_case() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE dinosaur 
          SET dino_name = upper(dino_name) WHERE dinosaur.diet_id = NEW.diet_id; 
		  RETURN NULL; 
     END;
$$;

CREATE TRIGGER uppercase
AFTER INSERT ON dinosaur
FOR EACH ROW EXECUTE FUNCTION upper_case()
	