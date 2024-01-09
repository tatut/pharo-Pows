Class {
	#name : #PowsAssertionFailure,
	#superclass : #Exception,
	#instVars : [
		'actual',
		'expected'
	],
	#category : #'Pows-Core'
}

{ #category : #accessing }
PowsAssertionFailure >> actual [

	^ actual
]

{ #category : #accessing }
PowsAssertionFailure >> actual: anObject [

	actual := anObject
]

{ #category : #accessing }
PowsAssertionFailure >> expected [

	^ expected
]

{ #category : #accessing }
PowsAssertionFailure >> expected: anObject [

	expected := anObject
]
