as yet unclassified
verifyJWT: aString

	| parts |
	
	parts := aString splitBy: '.'.
	self assert: parts size = 3.
	^ parts third = (self hmacSha256: ((parts first: 2) joinSeparatedBy: '.') secret: self secret)