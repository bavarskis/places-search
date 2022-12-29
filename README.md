# PlacesSearch

![](https://github.com/bavarskis/places-search/blob/develop/places.gif)

**PlacesSearch** is a demo app demonstrating my ability to build iOS apps using Swift UI.

## Setting up

The app relies on [Foursquare API](https://foursquare.com/developers) token. It is a static token stored in a text file. The text file is ignored by `Git`, so it can not be found in this project. For the app to function place the token text in a file named `foursquaretoken.txt` and add the file to the app bundle. 

## Structure and architecture

The project `Source` is split into `Shared` and `Modules` groups. `Shared` contains the code which is shared across the codebase such as networking objects, error, configuration, etc., while `Modules` contain feature specific code. 

The leading design pattern of the project is `MVVM` combined with `Dependency Injection`. I chose this for multiple reasons, the main ones being logic decoupling and enabling mocking and testing. Due to lack of time there are not many unit tests. 
