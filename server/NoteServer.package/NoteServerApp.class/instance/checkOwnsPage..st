as yet unclassified
checkOwnsPage: id

	| ownerId res |
	ownerId := self requestOwnerdIfNone: [^ false].
	
	res := self executeSQLStatement: ('SELECT COUNT(*) FROM notebook WHERE id=(SELECT notebook FROM page WHERE id=''{1}'') AND owner=''{2}'''
		format: {id. ownerId}).
	
	^ res dataRows first count > 0