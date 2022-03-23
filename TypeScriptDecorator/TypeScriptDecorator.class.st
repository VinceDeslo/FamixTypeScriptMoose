Class {
	#name : #TypeScriptDecorator,
	#superclass : #Object,
	#instVars : [
		'path',
		'home',
		'count'
	],
	#category : #TypeScriptDecorator
}

{ #category : #accessing }
TypeScriptDecorator >> exportNumberOccurencesByFile: aPath [ 
	"Generate csv file for number of decorator per file"
	
	| csvFile allJsonFiles data counter model anArray |
	home := FileLocator home.

	csvFile := (home / (aPath , '/csv/occurenceDecoratorParFichier.csv')).

	allJsonFiles := (home / (aPath , '/json')) allChildrenMatching: '*.json'.

	data := Array new: allJsonFiles size.
	counter := 1.

	allJsonFiles do: [ :fileName |
		model := fileName path.
		model asFileReference readStreamDo:
    	[ :stream | 
			model := FamixTypeScriptModel new importFromJSONStream: stream. 
	
			anArray:= Array new: 2.
			anArray at: 1 put: fileName.
			anArray at: 2 put: model allDecorator  numberOfItems.

			data at: counter put: anArray.
			counter := counter + 1.
		].
	].


	(csvFile) asFileReference
		writeStreamDo: [ :writeStream |
			(NeoCSVWriter on: writeStream)
 				writeHeader: #('Project name' 'Number of Decorators');
				nextPutAll: data ].
		
	data.
]

{ #category : #accessing }
TypeScriptDecorator >> exportNumberOccurencesByTypeDecorator: aPath [ 
	"Generate csv file for number of decorator per type of Decorators"
	
	| csvFile allJsonFiles dictDecoratorType filePath allDecorators data counter anArray |
	home := FileLocator home.

	csvFile := (home / (aPath , '/csv/decorateurOccurencesParType.csv')).

	allJsonFiles := (home / (aPath , '/json')) allChildrenMatching: '*.json'.

	dictDecoratorType := Dictionary new.

	allJsonFiles do: [ :fileName |
		filePath := fileName path.
		filePath asFileReference readStreamDo:
 	   [ :stream | 
			filePath := FamixTypeScriptModel new importFromJSONStream: stream. 
			allDecorators := filePath allDecorator  .
			allDecorators do:
				[:eachDecorator | 
					dictDecoratorType 
					at: eachDecorator decoratorType 
					ifPresent: [:value | dictDecoratorType at: eachDecorator decoratorType put: value + 1] 
					ifAbsentPut: 1
				].
			]
	].

	dictDecoratorType.

	data := Array new: dictDecoratorType size.

	counter := 1.

	dictDecoratorType associationsDo: [ :k | 
		anArray:= Array new: 2.
		anArray at: 1 put: k key.
		anArray at: 2 put: k value.
		data at: counter put: anArray.
		counter := counter + 1.
	 	].

	(csvFile) asFileReference
		writeStreamDo: [ :writeStream |
			(NeoCSVWriter on: writeStream)
 				writeHeader: #('Type de décorateur' 'Occurences');
				nextPutAll: data ].
		
	data.

]
