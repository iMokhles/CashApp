# Table of Contents

- [AACoreData](#section-id-3)
  - [Description](#section-id-10)
  - [Demonstration](#section-id-15)
  - [Requirements](#section-id-24)
- [Installation](#section-id-29)
  - [CocoaPods](#section-id-33)
  - [Carthage](#section-id-56)
  - [Manual Installation](#section-id-74)
  - [Define entities](#section-id-83)
  - [Shared Instance](#section-id-92)
  - [Creating your own data model](#section-id-102)
  - [Create new entity object](#section-id-119)
  - [Save your changes](#section-id-128)
  - [Fetch your records](#section-id-138)
  - [Delete a object](#section-id-166)
  - [Delete all objects](#section-id-180)
- [Contributions & License](#section-id-192)



<div id='section-id-3'/>

#AACoreData

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AACoreData.svg)](http://cocoadocs.org/docsets/AACoreData) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AACoreData.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AACoreData) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AACoreData.svg)]()


<div id='section-id-10'/>

##Description


AACoreData is a lightweight data persistence wrapper designed to provide an easier solution for `CRUD` operations using `CoreData`, written in Swift. It provides a singleton instance to access `CoreData` objects anywhere in the code and uses 'value types' to define `CoreData` entities.

<div id='section-id-15'/>

##Demonstration



![](https://github.com/EngrAhsanAli/AACoreData/blob/master/Screenshots/demo.gif)


To run the example project, clone the repo, and run `pod install` from the Example directory first.

<div id='section-id-24'/>

##Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+

<div id='section-id-29'/>

# Installation

AACoreData can be installed using CocoaPods, Carthage, or manually.

<div id='section-id-33'/>

##CocoaPods

AACoreData is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

$ gem install cocoapods

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AACoreData'
end

```

Finally, run the following command to install it:
```
$ pod install
```

<div id='section-id-56'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AACoreData" 
```

Then import the library in all files where you use it:
```ruby
import AACoreData
```

<div id='section-id-74'/>

##Manual Installation

Simply copy `Classes/AACoreData.swift` to your Xcode project and that's it!


Getting Started
----------


<div id='section-id-83'/>

##Define entities

```ruby
extension AACoreData {
    static let myEntity = AACoreDataEntity<String>("ExampleEntity")
}
```

<div id='section-id-92'/>

##Shared Instance

You can access the instance easily by adding this line in specific class or globally anywhere outside the class: 

```ruby
let instance = AACoreData.sharedInstance()
```


<div id='section-id-102'/>

##Creating your own data model

You have to create your own data model file in your project. By default `"AACoreData.xcdatamodeld"` is assumed to find in your project bundle like `./YouAppName/AACoreData.xcdatamodeld`
If you want to create different name of data model, then you have to specify it by using singleton property in `AppDelegate.swift`

```ruby
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    AACoreData.sharedInstance().dataModel = "ExampleDataModel"
    return true
}
```



<div id='section-id-119'/>

##Create new entity object 
```ruby
let record = instance.getNewObject(entityName: .myEntity) as! ExampleEntity
```



<div id='section-id-128'/>

##Save your changes  

```
instance.saveContext()
```



<div id='section-id-138'/>

##Fetch your records 

You can fetch your objects easily.
Note that parameters 'predicate' and 'sortDescriptors' are optional

```
instance.fetchRecords(entityName: #ENTITY#, predicate: #PREDICATE#, sortDescriptors: #SORTDECRIPTORS#, completion: #COMPLETION BLOCK#)
```

You can easily check the object's existence or fetch the required persist data

```ruby
instance.fetchRecords(entityName: .myEntity, sortDescriptors: [sorter]) { (results) in
if let result = results {
// MARK:- Record(s) found
// You can fetch using loop
}
else {
// MARK:- No Record found
// You can insert new record to avoid redundancy
}
}
```




<div id='section-id-166'/>

##Delete a object

You can easily delete an object using shared instance.

```
instance.deleteRecord(record)
```

> **Tip:** Don't forget to save changes after update persisted data using `instance.saveContext()`
> 



<div id='section-id-180'/>

##Delete all objects

You can easily remove all the records from an entity using shared instance

```
instance.deleteAllRecords(entity: .Example)
```



<div id='section-id-192'/>

#Contributions & License

`AACoreData` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AACoreData` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)
