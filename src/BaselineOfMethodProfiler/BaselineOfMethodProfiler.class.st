Class {
	#name : 'BaselineOfMethodProfiler',
	#superclass : 'Object',
	#category : 'BaselineOfMethodProfiler',
	#package : 'BaselineOfMethodProfiler'
}

{ #category : 'baselines' }
BaselineOfMethodProfiler >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec baseline: 'MethodProxies' with: [ spec repository: 'github://pharo-contributions/MethodProxies/src' ].

		spec package: 'MethodProfiler' with: [ spec requires: #( 'MethodProxies' ) ].
		spec group: 'default' with: #( 'MethodProfiler' )
	]
]
