CREATE OR REPLACE PROCEDURE SP_CreateOwner(
	_first_name VARCHAR,
	_last_name VARCHAR,
	_email VARCHAR,
	_phone_number VARCHAR,
	_street VARCHAR,
	_no VARCHAR,
	_postcode INTEGER,
	_cvr VARCHAR
)
LANGUAGE plpgsql AS 
$$
DECLARE
   _temp_serial_id INTEGER;
BEGIN
	INSERT INTO Address(postcode, street, no)
	VALUES(_postcode, _street, _no) RETURNING id INTO _temp_serial_id;

	INSERT INTO Owner(cvr, email, first_name, last_name, address_id)
	VALUES(_cvr, _email, _first_name, _last_name, _temp_serial_id);
	
	INSERT INTO Phone(number, cvr)
	VALUES(_phone_number, _cvr);
END
$$;

CREATE OR REPLACE PROCEDURE SP_CreateFarm(
	_name VARCHAR,
	_street VARCHAR,
	_no VARCHAR,
	_postcode INTEGER,
	_phone_number VARCHAR,
	_owner_cvr VARCHAR
)
LANGUAGE plpgsql AS 
$$
DECLARE
   _temp_serial_id INTEGER;
BEGIN
	INSERT INTO Address(postcode, street, no)
	VALUES(_postcode, _street, _no) 
		RETURNING id INTO _temp_serial_id;
	
	INSERT INTO Farm(phone_number, cvr, name, address_id)
	VALUES(_phone_number, _owner_cvr, _name, _temp_serial_id);
END
$$;

CREATE OR REPLACE PROCEDURE SP_CreateAnimal(
	_type VARCHAR,
	_sex VARCHAR,
	_age INTEGER,
	_birth TIMESTAMP,
	_death TIMESTAMP,
	_earmark_chr VARCHAR,
	_earmark_color_id INTEGER
)
LANGUAGE plpgsql AS 
$$
DECLARE
   _temp_serial_id INTEGER;
BEGIN
	INSERT INTO Earmark(color_id, chr)
	VALUES(_earmark_color_id, _earmark_chr)
		RETURNING id INTO _temp_serial_id;

	INSERT INTO Animal(type, sex, age, birth, death, earmark_id)
	VALUES(_type, _sex, _age, _birth, _death, _temp_serial_id);
END
$$;

