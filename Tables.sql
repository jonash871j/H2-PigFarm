-- Entities ***************************************************************

CREATE TABLE City(
	postcode INTEGER PRIMARY KEY,
	name VARCHAR(60)
);

CREATE TABLE Owner(
	cvr INTEGER PRIMARY KEY,
	email VARCHAR(100),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	postcode INTEGER,
	street VARCHAR(100),
	no INTEGER,

	FOREIGN KEY (postcode) REFERENCES City(postcode)
);

CREATE TABLE Phone(
	number INTEGER PRIMARY KEY,
	cvr INTEGER,

	FOREIGN KEY (cvr) REFERENCES Owner(cvr)
);


CREATE TABLE Farm(
	phone_number INTEGER PRIMARY KEY,
	name VARCHAR(60),
	postcode INTEGER,
	street VARCHAR(60),
	no INTEGER,

	FOREIGN KEY (postcode) REFERENCES City(postcode)
);

CREATE TABLE CHR(
	number INTEGER PRIMARY KEY,
	phone_number INTEGER,

	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Stall(
	no INTEGER PRIMARY KEY
);

-- Relations ***************************************************************

CREATE TABLE Owner_Farm(
	cvr INTEGER,
	phone_number INTEGER,

	PRIMARY KEY (cvr, phone_number),
	FOREIGN KEY (cvr) REFERENCES Owner(cvr),
	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number)
);

CREATE TABLE Farm_Stall(
	phone_number INTEGER,
	no INTEGER,

	PRIMARY KEY (phone_number, no),
	FOREIGN KEY (phone_number) REFERENCES Farm(phone_number),
	FOREIGN KEY (no) REFERENCES Stall(no)
);

CREATE TABLE Stall_Box(
	stall_no INTEGER,
	box_no INTEGER,

	PRIMARY KEY (stall_no, box_no),
	FOREIGN KEY (stall_no) REFERENCES Stall(no),
	FOREIGN KEY (box_no) REFERENCES Box(no)
);