# PopUpViewAlert

THIS IS MY FIRST FRAMEWORK! HOPE YOU LIKE IT, AND FIND IT USEFULL, IF YOU SEE ANY BUG LET ME KNOW :)

[![CI Status](http://img.shields.io/travis/Daniel Coimbra/PopUpViewAlert.svg?style=flat)](https://travis-ci.org/Daniel Coimbra/PopUpViewAlert)
[![Version](https://img.shields.io/cocoapods/v/PopUpViewAlert.svg?style=flat)](http://cocoapods.org/pods/PopUpViewAlert)
[![License](https://img.shields.io/cocoapods/l/PopUpViewAlert.svg?style=flat)](http://cocoapods.org/pods/PopUpViewAlert)
[![Platform](https://img.shields.io/cocoapods/p/PopUpViewAlert.svg?style=flat)](http://cocoapods.org/pods/PopUpViewAlert)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PopUpViewAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PopUpViewAlert"
```

After install it via cocoaPod, go to your project Target, under "Linked Frameworks and Libraries", add the PopUpViewAlert.framework, then you should be able to import the lib on your file.

```ruby
import PopUpViewAlert
```

## Usage

After import the framework to your class:

```ruby

var popView: View? = nil

override func viewDidLoad() {
	super.viewDidLoad()
		
    	popView = View(origem: 0, type: PopUpOptions.sucess, title: "")
    	self.view.addSubview(popView!)
}
  
```
With this constructor you will be able to set the origin Y of the pop up, if you want it on the top or on the middle, you can chose. 

you can make multiple pop ups appear in the same class, with different types! to do that just use this code when you want it to appear:

```ruby

self.popView?.handleOptionChange(.sucess, "Your text here",seconds: 4)

```

 ## Abilities

![alt text](https://user-images.githubusercontent.com/30239807/29527970-48ba382c-8692-11e7-8610-592a9c545b0f.jpg 
 

In this images, you can see the diferents types and advantages of this framwork.

There are different types of PopUps: Success, danger and error:

```ruby

self.popView?.handleOptionChange(.sucess, "Your text here",seconds: 4)

```
```ruby

self.popView?.handleOptionChange(.danger, "Your text here",seconds: 4)

```
```ruby

self.popView?.handleOptionChange(.error, "Your text here",seconds: 4)

```

and as you can see you are able to set the timmer that the popUp will remain in your screen, and if you touch the popUp view the view will pop out!



## Author

Daniel Coimbra, daniel.alexandrecoimbra@gmail.com

## License

PopUpViewAlert is available under the MIT license. See the LICENSE file for more info.
