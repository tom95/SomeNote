as yet unclassified
handlerLogin
	<post: '/login'>
	
	| res data ownerName ownerPassword owner token |
	data := Json readFrom: self request rawRequestContents readStream.
	ownerName := data at: 'name' ifAbsent: [^ self badRequest].
	ownerPassword := data at: 'password' ifAbsent: [^ self badRequest].
	
	res := self executeSQLStatement: 'SELECT * FROM owner WHERE name=''', ownerName,''''.
	owner := NoteOwner from: res dataRows first.
	
	(owner passwordMatches: ownerPassword) ifFalse: [^ self unauthorized].
	
	token := self class buildJWT: (Dictionary newFrom: {'ownerId' -> res dataRows first id}).
	^ self sendJson: (Dictionary newFrom: {'token' -> token}) asJsonString with: '/login'