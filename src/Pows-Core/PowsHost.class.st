Class {
	#name : #PowsHost,
	#superclass : #Object,
	#category : #'Pows-Core'
}

{ #category : #'as yet unclassified' }
PowsHost class >> download [ 
   | loc release releaseUrl |
 	loc := FileLocator temp / 'pows.jar'.
	loc exists ifTrue: [ ^ #alreadyExists ].
	release := self getLatestRelease.
	releaseUrl := (release at: 'assets') first at: 'browser_download_url'.
	Transcript show: 'Fetch pows host: ', releaseUrl; cr.
	"For some reason curl can do it, but ZnClient gets 401"
	LibC resultOfCommand: 'curl -o /tmp/pows.jar -L ', releaseUrl.
	
]

{ #category : #'as yet unclassified' }
PowsHost class >> getLatestRelease [
	| json |
	json := STONJSON fromString: (ZnClient new 
		headerAt: 'Accept' put: 'application/vnd.github+json';
		headerAt: 'X-GitHub-Api-Version' put: '2022-11-28';
		get: 'https://api.github.com/repos/tatut/pows/releases';
		response) entity string.
   ^ json first
]

{ #category : #testing }
PowsHost class >> isRunning [ 
	[ (ZnWebSocket to: self url)  ] on: Exception  do: [ ^ false  ].
	^ true
]

{ #category : #starting }
PowsHost class >> start [ 
"FIXME: pows should really have a PID-file so we could better detect. Or we could simply try connecting."
	self isRunning ifTrue: [ ^ self url ].
	self download. 
	LibC system: 'java -jar /tmp/pows.jar &'.
	[ self isRunning ] whileFalse: [ (Delay forSeconds: 1) wait ].
	^ self url
	
]

{ #category : #accessing }
PowsHost class >> url [ 
 ^ 'ws://localhost:3344'. "should be configurable?"
]
