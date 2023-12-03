# OV-GTFS-Kit

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate OV-GTFS-Kit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'OV-GTFS-Kit'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding OV-GTFS-Kit as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/artemlevv/OV-GTFS-Kit.git", .upToNextMajor(from: "0.0.2"))
]
```