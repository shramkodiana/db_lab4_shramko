DROP FUNCTION IF EXISTS dino_data(int);
--Функція виводить всі дані про динозавра, зріст якого більше вказаного

CREATE OR REPLACE FUNCTION dino_data(length_arg int)
    RETURNS TABLE (dinosaur varchar, diet varchar,type varchar, species varchar, country varchar, dino_length integer)
    LANGUAGE 'plpgsql'AS $$
BEGIN
    RETURN QUERY
        SELECT dino_name::varchar, dino_diet::varchar, dino_species::varchar, type_of_dino::varchar, lived_in::varchar, length_in_meters::int
		FROM dinosaur JOIN diet ON diet.diet_id = dinosaur.diet_id 
		JOIN species ON species.species_id = dinosaur.species_id
		JOIN type ON type.type_id = dinosaur.type_id
		WHERE length_in_meters > length_arg;
END;
$$
		