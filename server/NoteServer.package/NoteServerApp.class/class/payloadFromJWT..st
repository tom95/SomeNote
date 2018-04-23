as yet unclassified
payloadFromJWT: aString

	^ Json readFrom: (aString splitBy: '.') second base64Decoded readStream