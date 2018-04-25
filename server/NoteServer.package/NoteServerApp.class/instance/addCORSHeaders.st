as yet unclassified
addCORSHeaders

	self response
		fieldAt: 'Access-Control-Allow-Origin' put: '*';
		fieldAt: 'Access-Control-Allow-Headers' put: 'Authorization, Content-Type, Content-Length';
		fieldAt: 'Access-Control-Allow-Methods' put: 'GET, PUT, POST, DELETE'