Smalltalk at: #RPApplication ifAbsent: [
	Transcript show: 'RatPack not installed. For faster startup install and save before running this again.'; cr.
	Metacello new
		repository: 'github://hpi-swa/RatPack2.0:master/packages';
		baseline: 'RatPack';
		load].

ToolSet default: CommandLineToolSet.

"NoteServerApp runIn: NoteServerApp defaultMode on: 4567 named: 'SomeNote'"
