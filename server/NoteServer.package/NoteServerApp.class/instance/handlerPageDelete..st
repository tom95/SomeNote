as yet unclassified
handlerPageDelete: id
	<delete: '/page/([^/]+)'>

	| res |
	(self checkOwnsPage: id) ifFalse: [^ self unauthorized].
	res := self executeSQLStatement: 'DELETE FROM page WHERE id=', id.
	(res completedResponse value ~= 'DELETE 1') ifTrue: [^ self objectNotFound].
	
	^ self sendJson: Dictionary new asJsonString with: '/page/', id