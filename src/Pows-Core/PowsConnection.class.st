"
I am a WebSocket connection to the Playwright-over-WS host.

I can issue commands and assertions.
"
Class {
	#name : #PowsConnection,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #'Pows-Core'
}

{ #category : #'as yet unclassified' }
PowsConnection >> click: locator [
	^ self cmd: { #locator -> locator. #click -> true }
]

{ #category : #'initialize-release' }
PowsConnection >> close [ 
 	connection ifNil: [ ^ nil ]. 
	connection close. 
	^ connection := nil.
	
  
]

{ #category : #'as yet unclassified' }
PowsConnection >> cmd: cmdJsonMappings [ 
  | json responseText response | 
  json := STONJSON toString: cmdJsonMappings asDictionary.
  connection sendMessage: json.
  responseText := connection readMessage.
  response := STONJSON fromString: responseText.
  ^ (PowsResponse new json: response)
]

{ #category : #ssl }
PowsConnection >> connect [ 
	self connect: 'ws://localhost:3344'
]

{ #category : #ssl }
PowsConnection >> connect: url [ 
	connection := ZnWebSocket to: url
]

{ #category : #'client control' }
PowsConnection >> go: url [
	^ self cmd: { #go -> url }
]

{ #category : #'as yet unclassified' }
PowsConnection >> locate: aLocatorStringOrArray [
  ^ PowsLocator new 
      connection: self;
      locate: aLocatorStringOrArray;
		yourself.

]

{ #category : #'as yet unclassified' }
PowsConnection >> locate: loc do: block [ 
	block value: (self locate: loc)
]
