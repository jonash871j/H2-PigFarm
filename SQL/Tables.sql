-- Entities ***************************************************************

CREATE TABLE City(
	postcode INTEGER PRIMARY KEY NOT NULL,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE Address(
    id SERIAL PRIMARY KEY NOT NULL,
	postcode INTEGER NOT NULL,
	street VARCHAR(100) NOT NULL,
	no VARCHAR(10) NOT NULL,

	FOREIGN KEY (postcode) REFERENCES City(postcode)
);

CREATE TABLE Owner(
	cvr VARCHAR(8) PRIMARY KEY NOT NULL,
	email VARCHAR(100) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address_id  INTEGER NOT NULL,

	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE Phone(
	number VARCHAR(8) PRIMARY KEY NOT NULL,
	cvr VARCHAR(8) NOT NULL,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr)
);

CREATE TABLE Farm(
	phone_number VARCHAR(8) PRIMARY KEY NOT NULL,
	cvr VARCHAR(8) NOT NULL,
	name VARCHAR(60) NOT NULL,
	address_id  INTEGER NOT NULL,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr),
	FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE FarmCHR(
	chr VARCHAR(6) PRIMARY KEY NOT NULL,
	phone_number VARCHAR(8) NOT NULL,

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Stall(
	no INTEGER PRIMARY KEY NOT NULL,
	phone_number VARCHAR(8) NOT NULL,

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Box(
    no INTEGER PRIMARY KEY NOT NULL,
    type VARCHAR(30) NOT NULL,
    outdoor BOOLEAN NOT NULL
);

CREATE TABLE SmartUnit(
    serial_number INTEGER PRIMARY KEY NOT NULL,
    type VARCHAR(30) NOT NULL,
    ip_address VARCHAR(30) NOT NULL,
    mac_address VARCHAR(20) NOT NULL
);

CREATE TABLE State(
    id SERIAL PRIMARY KEY NOT NULL,
    severity VARCHAR(20) NOT NULL
);

CREATE TABLE EarmarkColor(
    id INTEGER PRIMARY KEY NOT NULL,
    color VARCHAR(25) NOT NULL
);

CREATE TABLE Earmark(
    id SERIAL PRIMARY KEY NOT NULL,
    chr VARCHAR(6) NOT NULL,
    color_id INTEGER NOT NULL,

    FOREIGN KEY (color_id) REFERENCES EarmarkColor(id)
);

CREATE TABLE Animal(
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(30) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    age INTEGER NOT NULL,
    birth TIMESTAMP NOT NULL,
    death TIMESTAMP NOT NULL,
    earmark_id INTEGER NOT NULL,

    FOREIGN KEY (earmark_id) REFERENCES Earmark(id)
);

-- Relations ***************************************************************

--
CREATE TABLE Stall_Box(
	stall_no INTEGER NOT NULL,
	box_no INTEGER NOT NULL,

	PRIMARY KEY (stall_no, box_no),
	FOREIGN KEY (stall_no) REFERENCES Stall(no),
	FOREIGN KEY (box_no) REFERENCES Box(no)
);

CREATE TABLE Box_SmartUnit(
    no INTEGER NOT NULL,
    serial_number INTEGER NOT NULL,
    value INTEGER NOT NULL,
    time TIMESTAMP NOT NULL,
    
    PRIMARY KEY (no, serial_number),
    FOREIGN KEY (no) REFERENCES Box(no),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number)
);

CREATE TABLE Box_Animal(
    id INTEGER NOT NULL,
    no INTEGER NOT NULL,
    move_in_time TIMESTAMP NOT NULL,
    move_out_time TIMESTAMP NOT NULL,
    
    PRIMARY KEY (id, no),
    FOREIGN KEY (id) REFERENCES Animal(id),
    FOREIGN KEY (no) REFERENCES Box(no)
);

CREATE TABLE SmartUnit_State(
    serial_number INTEGER NOT NULL,
    id INTEGER NOT NULL,
    time TIMESTAMP NOT NULL,
    
    PRIMARY KEY (serial_number, id),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number),
    FOREIGN KEY (id) REFERENCES State(id)
);

CREATE TABLE Stall_SmartUnit(
    no INTEGER NOT NULL,
    serial_number INTEGER NOT NULL,

    PRIMARY KEY (no, serial_number),
    FOREIGN KEY (no) REFERENCES Stall(no),
    FOREIGN KEY (serial_number) REFERENCES SmartUnit(serial_number)
);

CREATE TABLE Animal_Produce(
    id_child INTEGER NOT NULL,
    id_parent INTEGER NOT NULL,

    PRIMARY KEY (id_child, id_parent),
    FOREIGN KEY (id_child) REFERENCES Animal(id),
    FOREIGN KEY (id_parent) REFERENCES Animal(id)
);

