--CREATE OR REPLACE PROCEDURE SP_CreateAddress(
--	_postcode INTEGER,
--	_street VARCHAR(100),
--	_no VARCHAR(10)
--)
--LANGUAGE SQL
--AS $$
--	INSERT INTO Address(postcode, street, no)
--	VALUES(_postcode, _street, _street) RETURNING id;
--$$;

--CREATE OR REPLACE PROCEDURE SP_CreateOwner(
--	_first_name VARCHAR(50),
--	_last_name VARCHAR(50),
--	_email VARCHAR(100),
--	_phone_number VARCHAR(8),
--	_cvr VARCHAR(8),
--)
--LANGUAGE SQL
--AS $$
--	INSERT INTO Owner(cvr, email, first_name, last_name, address_id)
--	VALUES(_cvr, _email, _first_name, _last_name, _address_id)
--$$;

CREATE OR REPLACE PROCEDURE SP_CreateOwner(
	_owner_cvr VARCHAR,
	_owner_phone_number VARCHAR,
	_farm_phone_number VARCHAR,
	_farm_chr_number INTEGER,
)
LANGUAGE SQL
AS $$

$$;


