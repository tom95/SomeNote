as yet unclassified
setupTables

	self executeSQLStatement: 'CREATE TABLE IF NOT EXISTS owner (
		id 			serial PRIMARY KEY,
		name 		text UNIQUE,
		password 	text,
		salt 		text)'.

	self executeSQLStatement: 'CREATE TABLE IF NOT EXISTS notebook (
		id 			serial PRIMARY KEY,
		owner 		int REFERENCES owner (id),
		title 		text)'.
	
	self executeSQLStatement: 'CREATE TABLE IF NOT EXISTS page (
		id 			serial PRIMARY KEY,
		title 		text,
		content 	text,
		mtime 		timestamp DEFAULT current_timestamp,
		notebook 	integer REFERENCES notebook (id))'