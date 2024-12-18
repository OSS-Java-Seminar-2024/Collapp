BEGIN;

CREATE TABLE Team(
	id SERIAL NOT NULL,
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,

	PRIMARY KEY (id)
);

CREATE TABLE Users(
	id SERIAL NOT NULL,
	id_team INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(80)NOT NULL,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(255) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	role VARCHAR(30) NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (id_team) REFERENCES Team(id)
);	

CREATE TABLE Project(
	id SERIAL NOT NULL,
	id_team INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (id_team) REFERENCES Team(id)
);

CREATE TABLE Task(
	id SERIAL NOT NULL,
	id_project INT NOT NULL,
	id_asignee INT NOT NULL,
	id_reporter INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	status VARCHAR(50) NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (id_project) REFERENCES Project(id),
	FOREIGN KEY (id_asignee) REFERENCES Users(id),
	FOREIGN KEY (id_reporter) REFERENCES Users(id)
);

CREATE TABLE Comment(
	id SERIAL NOT NULL,
	id_task INT NOT NULL,
	id_user INT NOT NULL,
	content TEXT NOT NULL,
	time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_task) REFERENCES Task(id),
	FOREIGN KEY (id_user) REFERENCES Users(id)
);

END