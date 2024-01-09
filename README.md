# Pharo library for Playwright-over-WebSocket

Pharo library for doing browser testing with Playwright using the [Playwright over WebSocket (pows)](https://github.com/tatut/pows) host.

## Installation 

Via Metacello: 
```smalltalk
 Metacello new
   repository: 'github://tatut/pharo-Pows/src';
   baseline: 'Pows';
   load.
```

Or dependency in baseline:
```smalltalk
 spec package: 'Pows-Core' with: [ spec repository: 'github://tatut/pharo-Pows' ]
```


## Usage

You can use the `PowsConnection` directly but for testing you should subclass from `PowsTestCase` which automatically sets up a connection.

Example of a test method:
```smalltalk
testCounter 
  self 
  go: 'http://localhost:8080/examples/counter';
  locate: 'div.counter' assert: [ :l | l hasText: '0' ];
  locate: 'button.inc' do: #click;
  locate: 'div.counter' assert: [ :l | l hasText: '1' ];
  locate: 'button.dec' do: [ :b | b click; click ];
  locate: 'div.counter' assert: [ :l | l hasText: '-1' ]
```

The PowsTestCase has methods to navigate, assert on locators or do actions on them.
