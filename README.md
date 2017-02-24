# GRLayoutView

[![CI Status](http://img.shields.io/travis/AntiMoron/GRLayoutView.svg?style=flat)](https://travis-ci.org/AntiMoron/GRLayoutView)
[![Version](https://img.shields.io/cocoapods/v/GRLayoutView.svg?style=flat)](http://cocoapods.org/pods/GRLayoutView)
[![License](https://img.shields.io/cocoapods/l/GRLayoutView.svg?style=flat)](http://cocoapods.org/pods/GRLayoutView)
[![Platform](https://img.shields.io/cocoapods/p/GRLayoutView.svg?style=flat)](http://cocoapods.org/pods/GRLayoutView)

## About

Sometimes it's hard to place ```UIView```s through code. So here comes this library.
The library contributes to laying out elements on a ```UIScrollView``` with a single method.

Issues are welcomed

## Usage

Let's check how to use:

```objective-c
self.layoutView = GRVertical(self.textLabel, GRVerticalH(@"User Form", self.userName, self.password), self.submit);
self.layoutView.frame = self.view.bounds;
self.layoutView.headerContent = @"Demo page";
[self.view addSubview:self.layoutView];
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

GRLayoutView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GRLayoutView"
```

## License

GRLayoutView is available under the MIT license. See the LICENSE file for more info.
