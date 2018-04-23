as yet unclassified
badRequest

	self
		contentType: 'application/json';
		status: 400;
		body: '{"error": "400 bad request"}'