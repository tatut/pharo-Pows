Class {
	#name : #PowsResponse,
	#superclass : #Object,
	#instVars : [
		'json'
	],
	#category : #'Pows-Core'
}

{ #category : #accessing }
PowsResponse >> actual [ 
	^ json at: 'actual'
]

{ #category : #'error handling' }
PowsResponse >> error [ 
  self isSuccess ifTrue: [ ^ nil ].
  ^ json at: 'error'
]

{ #category : #accessing }
PowsResponse >> expected [ 
	^ json at: 'expected'
]

{ #category : #testing }
PowsResponse >> isSuccess [
	^ json at: 'success'
]

{ #category : #accessing }
PowsResponse >> json [

	^ json
]

{ #category : #accessing }
PowsResponse >> json: anObject [

	json := anObject
]

{ #category : #accessing }
PowsResponse >> result [ 
	^ json at: 'result' ifAbsent: [ true ]
]
