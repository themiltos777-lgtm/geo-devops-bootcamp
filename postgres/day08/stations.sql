CREATE TABLE platforms (
	id SERIAL PRIMARY KEY,
	platformnumber INTEGER,
	platformextension VARCHAR(10)
);

INSERT INTO platforms (platformnumber, platformextension) VALUES ('9', 'a');
