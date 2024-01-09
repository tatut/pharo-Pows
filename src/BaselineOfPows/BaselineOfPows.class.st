Class {
	#name : #BaselineOfPows,
	#superclass : #BaselineOf,
	#category : #BaselineOfPows
}

{ #category : #baselines }
BaselineOfPows >> baseline: spec [
  <baseline>
  spec for: #common do: [ 
	 spec
	 package: 'Zinc-WebSocket-Core' with: [ spec repository: 'github://svenvc/zinc' ];
	 package: 'Pows-Core' with: [ spec requires: #('Zinc-WebSocket-Core') ];
	 group: 'default' with: #('Pows-Core')
 ]
]
