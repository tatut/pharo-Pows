Class {
	#name : #PowsTestCase,
	#superclass : #TestCase,
	#instVars : [
		'connection'
	],
	#category : #'Pows-Core'
}

{ #category : #running }
PowsTestCase >> setUp [ 
   | powsUrl |
	super setUp.
	powsUrl := PowsHost start. 
	connection := PowsConnection new.
	connection connect: powsUrl.

]

{ #category : #running }
PowsTestCase >> tearDown [
	connection close.
	super tearDown
]
