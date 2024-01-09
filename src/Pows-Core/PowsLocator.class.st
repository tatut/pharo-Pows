Class {
	#name : #PowsLocator,
	#superclass : #Object,
	#instVars : [
		'locator',
		'connection',
		'not'
	],
	#category : #'Pows-Core'
}

{ #category : #accessing }
PowsLocator >> connection: anObject [

	connection := anObject
]

{ #category : #'as yet unclassified' }
PowsLocator >> doAssert: assertion [
	| resp | 
	resp := connection cmd: { #locator -> locator asArray. #not -> not. assertion }.
	resp isSuccess ifTrue: [ ^ true ].
	PowsAssertionFailure new 
		messageText: resp error;
 		expected: resp expected;
		actual: resp actual;
		signal
		 
]

{ #category : #testing }
PowsLocator >> hasText: text [ 
  ^ self doAssert: #hasText -> text
]

{ #category : #initialization }
PowsLocator >> initialize [
	locator := OrderedCollection new.
	not := false.
]

{ #category : #'as yet unclassified' }
PowsLocator >> locate: aLocatorStringOrArray [
	aLocatorStringOrArray isString 
		ifTrue: [ locator add: aLocatorStringOrArray ]
		ifFalse: [ locator addAll: (aLocatorStringOrArray collect: #asString) ].
	^ self
	 
]
