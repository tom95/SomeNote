as yet unclassified
handlerPageGet: id
	<get: '/page/([^/]+)'>

	| res |
	(self checkOwnsPage: id) ifFalse: [^ self unauthorized].
	res := self executeSQLStatement: 'SELECT * FROM page WHERE id=', id.
	
	^ res rows
		at: 1
		ifPresent: [:page | self sendJson: page dataKeyedByFieldName asJsonString with: '/page/', id]
		ifAbsent: [self objectNotFound]