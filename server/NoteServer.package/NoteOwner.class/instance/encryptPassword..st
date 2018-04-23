as yet unclassified
encryptPassword: aString

	| kdf |
	kdf := PBKDF2WithHmacSHA256 new.
	password := (kdf deriveKeyFromPassword: aString) base64Encoded.
	salt := kdf salt base64Encoded