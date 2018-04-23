as yet unclassified
buildJWT: aDataDictionary

	| headerAndPayload |
	headerAndPayload := '{"alg":"HS256","typ":"JWT"}' base64Encoded, '.', aDataDictionary asJsonString base64Encoded.
	
	^ headerAndPayload, '.', (self hmacSha256: headerAndPayload secret: self secret)