# FamixTypeScriptMoose

This repository serves to load a package called `TypeScriptDecorator` in Moose.   
This repository assumes prior knowledge of [Pharo](https://pharo.org/documentation) and [Moose](https://moosetechnology.org/#learn).

## 🔗 Related Repositories
- [FamixTypeScriptImporter](https://github.com/VinceDeslo/FamixTypeScriptImporter) : A parser that generates JSON Famix entities from TypeScript code.
- [FamixTypeScript](https://github.com/VinceDeslo/FamixTypeScriptMoose) : The metamodel implementation for Decorators.

## Main features :
- Generation of a CSV file for the number of decorators by type of decorator from JSON files

## Pre-requisites:
- JSON files gnerated from FamixTypeScriptImporter
- A FamixTypeScript metamodel loaded into the Moose environment
- In your main folder have two folders : JSON and CSV

## Folder descriptions:
JSON folder : location where you have all the JSON files that are to be read
CSV folder: location where the CSV files will be generated

In order to access the `TypeScriptDecorator` package, you will need to use [Iceberg](http://books.pharo.org/booklet-ManageCode/pdf/2019-03-24-ManageCode.pdf) to load the package.

After loading the packaging, you should be able to see it from the System browser like in the picture below.

![Screen Shot 2022-03-23 at 14 46 36](https://user-images.githubusercontent.com/2051632/159773576-41f3ef33-5942-4cad-91d6-33fab83a7187.png)

## Package Methods :
- `exportNumberOccurencesByFile`: generate a CSV file with number of decorators for each TypeScript file in the JSON
- `exportNumberOccurencesByTypeDecorator` : generate a CSV file with the number of decorators found by decorator type

## Commands to use in the Moose playground :

```st
decorator := TypeScriptDecorator new.
decorator exportNumberOccurencesByTypeDecorator: path.
decorator exportNumberOccurencesByFile: path.
```

The path is where your Moose image is located.   
- path for mac example : `path := '/Users/user/Moose8-final'.`
- path for PC example : `path := 'C:\Users\user\Pharo\images\Moose8-stable-01'.`
