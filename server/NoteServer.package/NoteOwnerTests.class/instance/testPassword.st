as yet unclassified
testPassword

	| owner |
	owner := NoteOwner new
		name: 'me';
		encryptPassword: 'abc'.
	
	self assert: (owner passwordMatches: 'abc')