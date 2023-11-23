!classDefinition: #DrivingAssistantTest category: 'ISW1-AutomaticCar'!
TestCase subclass: #DrivingAssistantTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-AutomaticCar'!

!DrivingAssistantTest methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:06:26'!
test01

	| drivingAssistant |
	drivingAssistant := DrivingAssistant new.
	
	drivingAssistant turnOn.
	
	self assert: drivingAssistant currentVelocity = (0 * kilometer/hour).
	self assert: drivingAssistant proximityBeepIsTurnedOff.
	self assert: drivingAssistant throttleIsConnected.
	self deny: drivingAssistant isApplyingBreaks.
	
	! !

!DrivingAssistantTest methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:16:24'!
test02

	| drivingAssistant |
	drivingAssistant := DrivingAssistant on: #Manual.
	
	drivingAssistant turnOn.
	
	self assert: drivingAssistant objectiveVelocity = 0.
	
	! !


!classDefinition: #SensorSystemTest category: 'ISW1-AutomaticCar'!
TestCase subclass: #SensorSystemTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-AutomaticCar'!

!SensorSystemTest methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 15:41:10'!
test01

	| aStreamOfVelocities sensorSystem |
	aStreamOfVelocities := ReadStream on: {100*kilometer/hour. 110*kilometer/hour}.
	sensorSystem := SensorSystem withVelocities: aStreamOfVelocities.
	
	self assert: sensorSystem currentVelocity = (0 * kilometer/hour).
	
	! !


!classDefinition: #DrivingAssistant category: 'ISW1-AutomaticCar'!
Object subclass: #DrivingAssistant
	instanceVariableNames: 'velocitySensor proximityBeep drivingMode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-AutomaticCar'!

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:00:00'!
currentVelocity
	
	^ velocitySensor! !

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:05:34'!
isApplyingBreaks
	
	^ false! !

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:16:20'!
objectiveVelocity
	
	^0! !

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 09:58:44'!
proximityBeepIsTurnedOff
	
	^ proximityBeep = #TurnedOff! !

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 10:03:57'!
throttleIsConnected
	
	^ true! !

!DrivingAssistant methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 09:59:30'!
turnOn
	
	velocitySensor := 0 * kilometer/hour.
	proximityBeep := #TurnedOff.! !


!DrivingAssistant methodsFor: 'initialization' stamp: 'JP 11/20/2023 10:16:05'!
initializeOn: aDrivingModeToBehave 
	
	drivingMode := aDrivingModeToBehave.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DrivingAssistant class' category: 'ISW1-AutomaticCar'!
DrivingAssistant class
	instanceVariableNames: ''!

!DrivingAssistant class methodsFor: 'instance creation' stamp: 'JP 11/20/2023 10:15:22'!
on: aModeToBehave 
	
	^self new initializeOn: aModeToBehave ! !


!classDefinition: #SensorSystem category: 'ISW1-AutomaticCar'!
Object subclass: #SensorSystem
	instanceVariableNames: 'streamOfVelocities currentVelocity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-AutomaticCar'!

!SensorSystem methodsFor: 'initialization' stamp: 'JP 11/20/2023 15:42:44'!
initializeWithVelocities: aStreamOfVelocities 
	
	currentVelocity := 0 * kilometer/hour.
	streamOfVelocities := aStreamOfVelocities.! !


!SensorSystem methodsFor: 'as yet unclassified' stamp: 'JP 11/20/2023 15:41:59'!
currentVelocity
	
	^currentVelocity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SensorSystem class' category: 'ISW1-AutomaticCar'!
SensorSystem class
	instanceVariableNames: ''!

!SensorSystem class methodsFor: 'instance creation' stamp: 'JP 11/20/2023 15:41:22'!
withVelocities: aStreamOfVelocities 
	
	^self new initializeWithVelocities: aStreamOfVelocities ! !
