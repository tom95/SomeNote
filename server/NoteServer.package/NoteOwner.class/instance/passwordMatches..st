as yet unclassified
passwordMatches: aString

	| kdf hash |
	kdf := PBKDF2WithHmacSHA256 new.
	kdf salt: self salt base64Decoded.
	hash := (kdf deriveKeyFromPassword: aString) base64Encoded.
	^ hash = password