as yet unclassified
handlerNotebooksGet
	<get: '/notebook'>

	| res ownerId |
	ownerId := self requestUserIdIfNone: [^ self unauthorized].
	
	res := self executeSQLStatement: ('SELECT * FROM notebook WHERE owner=''{1}''' format: {ownerId}).
	^ self sendJson: (res rows collect: #dataKeyedByFieldName) asJsonString with: '/notebook'