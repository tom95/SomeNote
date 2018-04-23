as yet unclassified
handlerOwnerPost
	<post: '/owner'>
	
	| res data owner |
	data := Json readFrom: self request rawRequestContents readStream.
	
	owner := NoteOwner new.
	owner name: (data at: 'name' ifAbsent: [^ self badRequest]).
	owner encryptPassword: (data at: 'password' ifAbsent: [^ self badRequest]).
	
	res := self executeSQLStatement: ('INSERT INTO owner(name,password,salt) VALUES(''{1}'',''{2}'',''{3}'') RETURNING id'
		format: {owner name. owner password. owner salt}).
	
	^ self sendJson: (Dictionary newFrom: {'id' -> res dataRows first id}) asJsonString with: '/owner'