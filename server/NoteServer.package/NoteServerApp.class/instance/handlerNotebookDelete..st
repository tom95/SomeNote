as yet unclassified
handlerNotebookDelete: id
	<delete: '/notebook/([^/]+)'>

	| res |
	(self checkOwnsNotebook: id) ifFalse: [^ self unauthorized].
	
	res := self executeSQLStatement: 'DELETE FROM notebook WHERE id=', id.
	(res completedResponse value ~= 'DELETE 1') ifTrue: [^ self objectNotFound].
	
	^ self sendJson: Dictionary new asJsonString with: '/notebook/', id