as yet unclassified
handlerNotebookPost
	<post: '/notebook'>
	
	| title res data ownerId |
	ownerId := self requestOwnerdIfNone: [^ self unauthorized].
	data := Json readFrom: self request rawRequestContents readStream.
	title := data at: 'title' ifAbsent: [^ self badRequest].
	
	res := self executeSQLStatement: ('INSERT INTO notebook(title,owner) VALUES(''{1}'',''{2}'') RETURNING id' format: {title. ownerId}).
	
	data at: 'id' put: res dataRows first id.
	data at: 'owner' put: ownerId.
	^ self sendJson: data asJsonString with: '/notebook'