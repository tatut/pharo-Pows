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

{ #category : #actions }
PowsLocator >> blur [ 
 ^ self doCmd: #blur -> 1
]

{ #category : #actions }
PowsLocator >> check [ 
 ^ self doCmd: #check -> 1
]

{ #category : #actions }
PowsLocator >> clear [ 
 ^self doCmd: #clear -> 1
]

{ #category : #actions }
PowsLocator >> click [
	self doCmd:  #click -> 1.
]

{ #category : #accessing }
PowsLocator >> connection: anObject [

	connection := anObject
]

{ #category : #asserting }
PowsLocator >> containsText: text [ 
 ^self doAssert: #containsText -> text
]

{ #category : #actions }
PowsLocator >> dblclick [ 
 ^ self doCmd: #dblclick -> 1
]

{ #category : #actions }
PowsLocator >> dispatchEvent: type [ 
  ^ self doCmd: #dispatchEvent -> type
]

{ #category : #private }
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

{ #category : #private }
PowsLocator >> doCmd: cmd [
	| resp | 
	resp := connection cmd: { #locator -> locator asArray. cmd }.
	resp isSuccess ifTrue: [ ^ resp result ].
	PowsAssertionFailure new 
		messageText: resp error;
		signal
		 
]

{ #category : #actions }
PowsLocator >> evaluate: js [ 
 ^ self doCmd: #evaluate -> js
]

{ #category : #actions }
PowsLocator >> fill: value [
 ^ self doCmd: #fill -> value
]

{ #category : #actions }
PowsLocator >> focus [ 
 ^self doCmd: #focus -> 1
]

{ #category : #asserting }
PowsLocator >> hasAttribute: name valued: value [ 
  ^ self doAssert: #hasAttribute -> { name. value }
]

{ #category : #asserting }
PowsLocator >> hasCSS: name valued: value [
	^self doAssert: #hasCSS -> { name. value }
]

{ #category : #asserting }
PowsLocator >> hasClass: class [
 ^ self doAssert: #hasClass -> class
]

{ #category : #asserting }
PowsLocator >> hasCount: count [
	^ self doAssert: #hasCount -> count
]

{ #category : #asserting }
PowsLocator >> hasId: id [
 ^self doAssert: #hasId -> id
]

{ #category : #asserting }
PowsLocator >> hasJSProperty: name valued: value [
 ^self doAssert: #hasJSProperty -> {  name . value }
]

{ #category : #asserting }
PowsLocator >> hasText: text [ 
  ^ self doAssert: #hasText -> text
]

{ #category : #asserting }
PowsLocator >> hasValue: value [ 
 ^self doAssert: #hasValue -> value
]

{ #category : #asserting }
PowsLocator >> hasValues: values [ 
 ^self doAssert: #hasValues -> { values }
]

{ #category : #actions }
PowsLocator >> hover [ 
 ^ self doCmd: #hover -> 1
]

{ #category : #initialization }
PowsLocator >> initialize [
	locator := OrderedCollection new.
	not := false.
]

{ #category : #actions }
PowsLocator >> innerHTML [ 
 ^ self doCmd: #innerHTML -> 1
]

{ #category : #actions }
PowsLocator >> innerText [ 
 ^self doCmd: #innerText -> 1
]

{ #category : #asserting }
PowsLocator >> isAttached [ 
 ^ self doAssert: #isAttached -> 1
]

{ #category : #asserting }
PowsLocator >> isChecked [ 
 ^self doAssert: #isChecked -> 1
]

{ #category : #asserting }
PowsLocator >> isDisabled [ 
 ^self doAssert: #isDisabled -> 1
]

{ #category : #asserting }
PowsLocator >> isEditable [
 ^self doAssert: #isEditable -> 1
]

{ #category : #asserting }
PowsLocator >> isEmpty [ 
 ^self doAssert: #isEmpty -> 1
]

{ #category : #asserting }
PowsLocator >> isEnabled [ 
 ^self doAssert: #isEnabled -> 1
]

{ #category : #asserting }
PowsLocator >> isFocused [ 
 ^self doAssert: #isFocused -> 1
]

{ #category : #asserting }
PowsLocator >> isHidden [ 
 ^self doAssert: #isHidden -> 1
]

{ #category : #asserting }
PowsLocator >> isInViewport [ 
 ^self doAssert: #isInViewport -> 1
]

{ #category : #asserting }
PowsLocator >> isVisible [ 
 ^self doAssert: #isVisible -> 1
]

{ #category : #accessing }
PowsLocator >> locate: aLocatorStringOrArray [
	aLocatorStringOrArray isString 
		ifTrue: [ locator add: aLocatorStringOrArray ]
		ifFalse: [ locator addAll: (aLocatorStringOrArray collect: #asString) ].
	^ self
	 
]

{ #category : #actions }
PowsLocator >> press: keyName [ 
 ^self doCmd: #press -> keyName
]

{ #category : #actions }
PowsLocator >> pressSequentially: text [ 
  ^ self doCmd: #pressSequentially -> text

]

{ #category : #actions }
PowsLocator >> selectOption: option [
 ^self doCmd: #selectOption -> option
]

{ #category : #actions }
PowsLocator >> selectText [  
  ^ self doCmd: #selectText -> 1
]

{ #category : #actions }
PowsLocator >> setChecked: checked [ 
 ^ self doCmd: #setChecked -> checked
]

{ #category : #actions }
PowsLocator >> tap [ 
 ^self doCmd: #tap -> 1
]

{ #category : #actions }
PowsLocator >> type: text [
  ^ self doCmd: #type -> text
]

{ #category : #actions }
PowsLocator >> uncheck [ 
 ^self doCmd: #uncheck -> 1
]
