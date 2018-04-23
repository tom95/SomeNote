as yet unclassified
handlerNotebookGet: id
	<get: '/notebook/([^/]+)'>

	| res |
	(self checkOwnsNotebook: id) ifFalse: [^ self unauthorized].
	
	res := self executeSQLStatement: 'SELECT * FROM notebook WHERE id=', id.
	
	^ res rows
		at: 1
		ifPresent: [:page | self sendJson: page dataKeyedByFieldName asJsonString with: '/page/', id]
		ifAbsent: [self objectNotFound]