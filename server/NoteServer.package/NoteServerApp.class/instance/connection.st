as yet unclassified
connection

	connection ifNil: [connection := PGConnection new].
	
	^ connection connectionArgs: connectionArguments