as yet unclassified
sendJson: aString with: aUrlString

	self addCORSHeaders.
	super sendJson: aString with: aUrlString