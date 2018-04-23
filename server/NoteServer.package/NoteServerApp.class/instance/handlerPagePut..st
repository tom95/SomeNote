as yet unclassified
handlerPagePut: id
	<put: '/page/([^/]+)'>
	
	| data |
	(self checkOwnsPage: id) ifFalse: [^ self unauthorized].
	
	data := (Json readFrom: self request rawRequestContents readStream)
		associationsSelect: [:assoc | #('notebook' 'title' 'content') includes: assoc key].
	
	data ifEmpty: [^ self badRequest].
	
	self executeSQLStatement: ('UPDATE page SET ', ((Array streamContents: [:stream | data keysAndValuesDo: [:key :val | stream nextPut: key, '=''', val, '''']]) joinSeparatedBy: ',')).
	
	^ self sendJson: data asJsonString with: '/notebook/', id