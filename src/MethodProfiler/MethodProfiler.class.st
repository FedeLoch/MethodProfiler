Class {
	#name : 'MethodProfiler',
	#superclass : 'Object',
	#category : 'MethodProfiler-MethodProfiler',
	#package : 'MethodProfiler',
	#tag : 'MethodProfiler'
}

{ #category : 'accessing' }
MethodProfiler class >> methodsCalled: handlers [

	^ handlers inject: Dictionary new into: [ :dict :handler |
		dict at: handler method name put: handler count; yourself
	]

]

{ #category : 'accessing' }
MethodProfiler class >> profile: program [

	^ self profile: [ program run ] for: (program classesToExecute flatCollect: #methods)
	
	

]

{ #category : 'accessing' }
MethodProfiler class >> profile: block for: methods [

	| handlers methodProxies |

	methodProxies := methods collect: [ :method |
		MpMethodProxy onMethod: method handler: (MethodHandler new method: method)
	].

	handlers := methodProxies collect: #handler.
	
	"Installing method proxies and executing"
	[
		methodProxies do: #install.
		MpMethodProxy enableInstrumentation.
		block value.
	] ensure: [
		MpMethodProxy disableInstrumentation.
		methodProxies do: [ :mp | mp isInstalled ifTrue: [ mp uninstall ] ]
	].

	^ self result: handlers
]

{ #category : 'accessing' }
MethodProfiler class >> result: handlers [

	^ { 'methodsCalled' -> (self methodsCalled: handlers) } asDictionary
]
