as yet unclassified
handlerPagesForNotebook: id dummy: pages
	<get: '/notebook/([^/]+)/pages'>
	
	| res |
	(self checkOwnsNotebook: id) ifFalse: [^ self unauthorized].
	
	res := self executeSQLStatement: 'SELECT * FROM page WHERE notebook=', id.
	
	^ self sendJson: (res rows collect: #dataKeyedByFieldName) asJsonString with: '/notebook/', id, '/pages'