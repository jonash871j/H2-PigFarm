do $$ 
declare
	-- PRIMARY KEYS
	_cvr INTEGER := '345345';
	_owner_phone_number INTEGER := '324234';
	_farm_phone_number INTEGER := '567657';
	
   _temp_serial_id INTEGER;
begin 
	-- Owner
	INSERT INTO Address(postcode, street, no)
	VALUES(4000, 'DummyVej', '2b') RETURNING id INTO _temp_serial_id;

	INSERT INTO Owner(cvr, email, first_name, last_name, address_id)
	VALUES(_cvr, 'dummy@gmail.com', 'FirstDummy', 'LastDummy', _temp_serial_id);
	
	INSERT INTO Phone(number, cvr)
	VALUES(_owner_phone_number, _cvr);
	
	-- Farm
	INSERT INTO Address(postcode, street, no)
	VALUES(4000, 'FarmVej', '43') RETURNING id INTO _temp_serial_id;
	
	INSERT INTO Farm(phone_number, cvr, name, address_id)
	VALUES(_farm_phone_number, _cvr, 'Some Farm', _temp_serial_id);
	
	INSERT INTO CHR(number, phone_number)
	VALUES(234, _farm_phone_number);
	
end $$;
