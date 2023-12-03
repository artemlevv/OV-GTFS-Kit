# OV-GTFS-Kit

- [Description](#description)
- [Installation](#installation)
- [Quick Start](#quick-start)
  - [Static GTFS](#static-gtfs)
  - [Realtime GTFS](#realtime-gtfs)
  - [Map Annotations](#map-annotations)
  
## Description

OV-GTFS-Kit is a comprehensive framework designed to simplify the handling of General Transit Feed Specification (GTFS) data, catering to both static and real-time datasets. This versatile library empowers developers to seamlessly work with GTFS data, facilitating efficient integration of public transportation information into applications.

The framework excels in working with both static GTFS schedules and real-time updates, offering a unified solution for working with diverse transit data sources. By providing a streamlined interface, OV-GTFS-Kit enables developers to effortlessly incorporate public transport overlays and annotations onto maps, enhancing the visualization of transit networks.


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

## Quick Start

### Static GTFS
```swift
let staticGTFS = try GTFS(path: folderPath)
```
Initialization of static GTFS data. Put here `folderPath` which is path folder to yout static GTFS data. 

### Realtime GTFS
```swift
let realtimeGTFS = try GTFSRealtime_FeedMessage(serializedData: fetchData())
```
Initialization of realtime GTFS data, where `fetchData()` is function which return data from GET request 

### Map Annotations 
```swift
mapView.addStopAnnotations(gtfs: staticGTFS)
```
Adding stops of public transport to `MKMapView`. Also you can add here custom image of stops. 

```swift
mapView.addVehicleAnnotations(gtfs: staticGTFS, gtfs_realtime: realtimeGTFS)
```
Adding vehicles to `MKMapView`. Also you can add here custom image of vehicle. To keep vehicle positions updated, update real-time GTFS data. 

```swift
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
```
For annotations to be displayed correctly, add the MKMapViewDelegate


