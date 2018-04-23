as yet unclassified
initialize

	super initialize.
	
	self connectTo: 'noteserver' on: 'localhost' at: 5432 as: 'postgres' with: 'secret'.
	self setupTables