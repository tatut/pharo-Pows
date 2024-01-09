Class {
	#name : #PowsTestCase,
	#superclass : #TestCase,
	#instVars : [
		'connection',
		'powsUrl'
	],
	#category : #'Pows-Core'
}

{ #category : #'client control' }
PowsTestCase >> go: url [
  connection go: url
]

{ #category : #initialization }
PowsTestCase >> initialize [ 
 	super initialize.
   powsUrl := PowsHost start. 

]

{ #category : #'as yet unclassified' }
PowsTestCase >> locate: loc assert: block [ 
	| v |
	v := block value: (connection locate: loc).
	self assert: v equals: true
]

{ #category : #'as yet unclassified' }
PowsTestCase >> locate: loc do: block [
	connection locate: loc do: block
]

{ #category : #running }
PowsTestCase >> setUp [ 
	super setUp.
	connection := PowsConnection new.
	connection connect: powsUrl.

]

{ #category : #running }
PowsTestCase >> tearDown [
	connection close.
	connection := nil.
	super tearDown
]
