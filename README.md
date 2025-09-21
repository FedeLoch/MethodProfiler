# Pharo Method Profiler

## Getting started

```Smalltalk
Metacello new
    baseline: 'MethodProfiler';
    repository: 'github://FedeLoch/MethodProfiler:main';
    load
```

## How to use it

```Smalltalk
    program := PBABenchmarkProgram bench: SMarkDeltaBlue new.
    methods := SMarkDeltaBlue package classes flatCollect: #methods

    MethodProfiler profile: [ program run ] for: methods
```
