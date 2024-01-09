Class {
	#name : #PowsHost,
	#superclass : #Object,
	#classVars : [
		'Uberjar'
	],
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
	LibC system: 'curl -o /tmp/pows.jar -L ', releaseUrl.
	
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

{ #category : #starting }
PowsHost class >> start [ 
	self download. 
	LibC system: 'java -jar /tmp/pows.jar &'
]
