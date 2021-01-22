-- Entities ***************************************************************

CREATE TABLE City(
	postcode INTEGER PRIMARY KEY,
	name VARCHAR(60)
);

CREATE TABLE Address(
    id SERIAL PRIMARY KEY,
	postcode INTEGER,
	street VARCHAR(100),
	no VARCHAR(10),

	FOREIGN KEY (postcode) REFERENCES City(postcode)
);

CREATE TABLE Owner(
	cvr INTEGER PRIMARY KEY,
	email VARCHAR(100),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id  INTEGER,

	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE Phone(
	number INTEGER PRIMARY KEY,
	cvr INTEGER,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr)
);


CREATE TABLE Farm(
	phone_number INTEGER PRIMARY KEY,
	cvr INTEGER,
	name VARCHAR(60),
	address_id  INTEGER,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr),
	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE CHR(
	number INTEGER PRIMARY KEY,
	phone_number INTEGER,

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Stall(
	no INTEGER PRIMARY KEY,
	phone_number INTEGER,

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Box(
    no INTEGER PRIMARY KEY,
    type VARCHAR(30),
    outdoor BOOLEAN
);

CREATE TABLE SmartUnit(
    serial_number INTEGER PRIMARY KEY,
    type VARCHAR(30),
    ip_address VARCHAR(30),
    mac_address VARCHAR(20)
);

CREATE TABLE State(
    id SERIAL PRIMARY KEY,
    severity VARCHAR(20)
);

CREATE TABLE Animal(
    id SERIAL PRIMARY KEY,
    type VARCHAR(30),
    sex VARCHAR(10),
    age INTEGER,
    birth TIMESTAMP,
    death TIMESTAMP,
    earmarkchrno INTEGER,
    earmarkid INTEGER,
    earmarkcolor VARCHAR(20)
);

-- Relations ***************************************************************

--
CREATE TABLE Stall_Box(
	stall_no INTEGER,
	box_no INTEGER,

	PRIMARY KEY (stall_no, box_no),
	FOREIGN KEY (stall_no) REFERENCES Stall(no),
	FOREIGN KEY (box_no) REFERENCES Box(no)
);

CREATE TABLE Box_SmartUnit(
    no INTEGER,
    serial_number INTEGER,
    value INTEGER,
    time TIME,
    
    PRIMARY KEY (no, serial_number),
    FOREIGN KEY (no) REFERENCES Box(no),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number)
);

CREATE TABLE Box_Animal(
    id INTEGER,
    no INTEGER,
    move_in_time TIMESTAMP,
    move_out_time TIMESTAMP,
    
    PRIMARY KEY (id, no),
    FOREIGN KEY (id) REFERENCES Animal(id),
    FOREIGN KEY (no) REFERENCES Box(no)
);

CREATE TABLE SmartUnit_State(
    serial_number INTEGER,
    id INTEGER,
    time TIME,
    
    PRIMARY KEY (serial_number, id),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number),
    FOREIGN KEY (id) REFERENCES State(id)
);

CREATE TABLE Stall_SmartUnit(
    no INTEGER,
    serial_number INTEGER,

    PRIMARY KEY (no, serial_number),
    FOREIGN KEY (no) REFERENCES Stall(no),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number)
);

CREATE TABLE Animal_Produce(
    id_child INTEGER,
    id_parent INTEGER,

    PRIMARY KEY (id_child, id_parent),
    FOREIGN KEY (id_child) REFERENCES Animal(id),
    FOREIGN KEY (id_parent) REFERENCES Animal(id)
);