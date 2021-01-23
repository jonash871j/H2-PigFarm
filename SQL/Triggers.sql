-- Used to calculate animal age and update Animal table
CREATE OR REPLACE FUNCTION TF_UpdateAnimalAge()
RETURNS TRIGGER AS
$$
DECLARE
     _age INTEGER;
BEGIN
	SELECT date_part('year', age(birth)) INTO _age 
	FROM Animal
	WHERE id = NEW.id;

	UPDATE Animal
	SET age = _age
	WHERE id = NEW.id;
	RETURN OLD;
END;
$$
LANGUAGE PLPGSQL;

-- When animal gets created 
-- calculate animal age and update Animal table
CREATE TRIGGER TR_UpdateAnimalAge
AFTER INSERT ON Animal
FOR EACH ROW
EXECUTE FUNCTION TF_UpdateAnimalAge();