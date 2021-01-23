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
	cvr VARCHAR(8) PRIMARY KEY,
	email VARCHAR(100),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id  INTEGER,

	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE Phone(
	number VARCHAR(8) PRIMARY KEY,
	cvr VARCHAR(8),

	FOREIGN KEY (cvr) REFERENCES Owner(cvr)
);


CREATE TABLE Farm(
	phone_number VARCHAR(8) PRIMARY KEY,
	cvr VARCHAR(8),
	name VARCHAR(60),
	address_id  INTEGER,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr),
	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE FarmCHR(
	chr VARCHAR(6) PRIMARY KEY,
	phone_number VARCHAR(8),

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Stall(
	no INTEGER PRIMARY KEY,
	phone_number VARCHAR(8),

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

CREATE TABLE EarmarkColor(
    id INTEGER PRIMARY KEY,
    color VARCHAR(25)
);

CREATE TABLE Earmark(
    id SERIAL PRIMARY KEY,
    chr VARCHAR(6),
    color_id INTEGER,

    FOREIGN KEY (color_id) REFERENCES EarmarkColor(id)
);

CREATE TABLE Animal(
    id SERIAL PRIMARY KEY,
    type VARCHAR(30),
    sex VARCHAR(10),
    age INTEGER,
    birth TIMESTAMP,
    death TIMESTAMP,
    earmark_id INTEGER,

    FOREIGN KEY (earmark_id) REFERENCES Earmark(id)
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
    time TIMESTAMP,
    
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
    time TIMESTAMP,
    
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