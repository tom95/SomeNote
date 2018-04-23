as yet unclassified
connectTo: aDBName on: aHost at: aPort as: aUser with: aPassword 

	connectionArguments := PGConnectionArgs
									hostname: aHost
									portno: aPort
									databaseName: aDBName
									userName: aUser
									password: aPassword