# FamixTypeScriptMoose

This repository is to load a package TypeScriptDecorator in Moose.

Main features :
- generate a csv file for the number of decorators by type of decorator from json files

Pre-requisites:
- json files gnerated from FamixTypeScriptImporter
- have the FamixTypeScript load with all the metamodels
- in your main folder have two folders : json and csv

json folder : it is where you have all the json files that would be read
csv folder would be where the csv files would be generated

In order to access the TypeScriptDecorator package, you will need to use Iceberg to load the package.

After loading the packaging, you should be able to see it from the System browser like the picture below.

![Screen Shot 2022-03-23 at 14 46 36](https://user-images.githubusercontent.com/2051632/159773576-41f3ef33-5942-4cad-91d6-33fab83a7187.png)

There is 2 methods :
- exportNumberOccurencesByFile: generate a csv file with number of decorators for each file
- exportNumberOccurencesByTypeDecorator : generate a csv file with number of decorators by decorator type

Commands to use in the playground

decorator := TypeScriptDecorator new.

decorator exportNumberOccurencesByTypeDecorator: path.

decorator exportNumberOccurencesByFile: path.

The path is where you Moose image is located.
path for mac example :
path := '/Users/user/Moose8-final'.

path for PC example :
path := 'C:\Users\user\Pharo\images\Moose8-stable-01'.
