as yet unclassified
handlerPagePost
	<post: '/page'>
	
	| title res data content notebook |
	data := Json readFrom: self request rawRequestContents readStream.
	title := data at: 'title' ifAbsent: [^ self badRequest].
	content := data at: 'content' ifAbsent: [^ self badRequest].
	notebook := data at: 'notebook' ifAbsent: [^ self badRequest].
	
	(self checkOwnsNotebook: notebook) ifFalse: [^ self unauthorized].
	
	res := self executeSQLStatement: ('INSERT INTO page(title,content,notebook) VALUES(''{1}'',''{2}'',{3}) RETURNING id'
		format: {title. content. notebook}).
	
	data at: 'id' put: res dataRows first id.
	^ self sendJson: data asJsonString with: '/page'