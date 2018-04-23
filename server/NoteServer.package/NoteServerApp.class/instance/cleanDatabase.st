as yet unclassified
cleanDatabase

	self
		executeSQLStatement: 'DROP TABLE IF EXISTS page';
		executeSQLStatement: 'DROP TABLE IF EXISTS notebook';
		executeSQLStatement: 'DROP TABLE IF EXISTS owner'