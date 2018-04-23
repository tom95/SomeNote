as yet unclassified
hmacSha256: aString secret: anotherString

	^ (SHA256 new hmac key: anotherString asByteArray; digestMessage: aString asByteArray) asByteArray base64Encoded