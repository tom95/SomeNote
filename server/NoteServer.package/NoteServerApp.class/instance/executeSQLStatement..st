as yet unclassified
executeSQLStatement: anSQLStatement
	
	| response |
	self connection startup.
	response := self connection execute: anSQLStatement.
	self connection terminate.
	response errorResponse ifNotNil: [self error: response errorResponse value].
	^ response