CALL SP_CreateOwner('TestFirst', 'TestLast', 'dummy@owner.dk', '12345678', 'gårdvej', '24', 4000, '12123434');
CALL SP_CreateFarm('DummyFarm', 'FarmStreet', '2', 4000, '23546523', '12123434');

INSERT INTO EarmarkColor(id, color) VALUES(1, 'Gul');
INSERT INTO EarmarkColor(id, color) VALUES(2, 'Rød');
INSERT INTO EarmarkColor(id, color) VALUES(3, 'Hvid');

CALL SP_CreateAnimal('Gris', 'Han', '2017-01-01'::timestamp, '2021-01-30'::timestamp, '163526', 1);
CALL SP_CreateAnimal('Gris', 'Hun', '2017-02-01'::timestamp, '2021-01-30'::timestamp, '645634', 2);

INSERT INTO Box(no, type, outdoor) VALUES(654, 'SomeType1', true);
INSERT INTO Box(no, type, outdoor) VALUES(123, 'SomeType2', false);
INSERT INTO Box(no, type, outdoor) VALUES(778, 'SomeType3', false);

INSERT INTO SmartUnit(serial_number, type, ip_address, mac_address)
VALUES(1234, 'SomeType4', '192.168.1.32', '43EF34EF34EF');
INSERT INTO SmartUnit(serial_number, type, ip_address, mac_address)
VALUES(4321, 'SomeType5', '192.168.1.64', '23FE65EF34EF');
INSERT INTO SmartUnit(serial_number, type, ip_address, mac_address)
VALUES(9988, 'SomeType6', '192.168.1.128', '998865EF3477');

INSERT INTO Box_SmartUnit(no, serial_number, value, time)
VALUES(778, 9988, '324', '2020-01-23 18:54:25'::timestamp);
INSERT INTO Box_SmartUnit(no, serial_number, value, time) 
VALUES(654, 4321, '324', '2020-01-24 8:36:19'::timestamp);
INSERT INTO Box_SmartUnit(no, serial_number, value, time) 
VALUES(654, 1234, '324', '2020-01-25 10:12:23'::timestamp);




--do $$ 
--declare
--	-- PRIMARY KEYS
--	_owner_cvr VARCHAR := '67867';
--	_owner_phone_number VARCHAR := '567';
--	_farm_phone_number VARCHAR := '567';
--	_farm_chr_number INTEGER := 12;
--	_stall_no INTEGER := 7689;
--	_box_no INTEGER := 456;
--	_smart_unit_serial_number INTEGER := 678;
	
--	-- Serial ids
--   _temp_serial_id INTEGER;
--   _animal_id INTEGER;
--   _state_id INTEGER;
--begin 
--	-- Entities ***************************************************
--	-- Owner
--	INSERT INTO Address(postcode, street, no)
--	VALUES(4000, 'DummyVej', '2b') RETURNING id INTO _temp_serial_id;

--	INSERT INTO Owner(cvr, email, first_name, last_name, address_id)
--	VALUES(_owner_cvr, 'dummy@gmail.com', 'FirstDummy', 'LastDummy', _temp_serial_id);
	
--	INSERT INTO Phone(number, cvr)
--	VALUES(_owner_phone_number, _owner_cvr);
	
--	-- Farm
--	INSERT INTO Address(postcode, street, no)
--	VALUES(4000, 'FarmVej', '43') RETURNING id INTO _temp_serial_id;
	
--	INSERT INTO Farm(phone_number, cvr, name, address_id)
--	VALUES(_farm_phone_number, _owner_cvr, 'Some Farm', _temp_serial_id);
	
--	INSERT INTO CHR(number, phone_number)
--	VALUES(_farm_chr_number, _farm_phone_number);
	
--	-- Stall	
--	INSERT INTO Stall(no, phone_number)
--	VALUES(_stall_no, _farm_phone_number);
	
--	-- Box	
--	INSERT INTO Box(no, type, outdoor)
--	VALUES(_box_no, 'SomeType', true);
	
--	-- SmartUnit	
--	INSERT INTO SmartUnit(serial_number, type, ip_address, mac_address)
--	VALUES(_smart_unit_serial_number, 'SomeType', '192.168.1.32', '43EF34EF34EF');
	
--	-- State	
--	INSERT INTO State(severity)
--	VALUES('SomeSeverity') RETURNING id INTO _state_id;
	
--	-- Animal	
--	INSERT INTO Animal(type, sex, age, birth, death, earmarkchrno, earmarkid, earmarkcolor)
--	VALUES('SomeType', 'Male', '4', '2017-01-01'::timestamp, '2022-01-01'::timestamp, 123, 567, 'Red') 
--		RETURNING id INTO _animal_id;

--	-- Relations ***************************************************
	
--	INSERT INTO Stall_Box(stall_no, box_no)
--	VALUES(_stall_no, _box_no);
	
--	INSERT INTO Box_SmartUnit(no, serial_number, value, time)
--	VALUES(_box_no,_smart_unit_serial_number, '324', '2020-01-22'::timestamp);
	
--	INSERT INTO Box_Animal(id, no, move_in_time, move_out_time)
--	VALUES(_animal_id, _box_no, '2020-01-01'::timestamp, '2020-01-30'::timestamp);
	
--	INSERT INTO SmartUnit_State(serial_number, id, time)
--	VALUES(_smart_unit_serial_number, _state_id, '2020-01-30'::timestamp);
	
--	INSERT INTO Stall_SmartUnit(no, serial_number)
--	VALUES(_stall_no, _smart_unit_serial_number);
--end $$;


