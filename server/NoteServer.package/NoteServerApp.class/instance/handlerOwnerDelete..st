as yet unclassified
handlerOwnerDelete: id
	<delete: '/owner/([^/]+)'>

	| res ownerId |
	ownerId := self requestUserIdIfNone: [^ self unauthorized].
	ownerId ~= id ifTrue: [^ self unauthorized].
	
	res := self executeSQLStatement: 'DELETE FROM owner WHERE id=', id.
	(res completedResponse value ~= 'DELETE 1') ifTrue: [^ self objectNotFound].
	
	^ self sendJson: Dictionary new asJsonString with: '/owner/', id