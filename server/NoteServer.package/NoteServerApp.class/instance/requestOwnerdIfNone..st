as yet unclassified
requestOwnerdIfNone: aBlock

	| token |
	token := (self request headerAt: 'authorization' ifAbsent: aBlock).
	(self class verifyJWT: token) ifFalse: aBlock.
	
	^ (self class payloadFromJWT: token) at: 'ownerId'