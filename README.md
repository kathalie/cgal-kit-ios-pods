# CGALKit

**CGALKit** is a Swift framework that integrates powerful computational geometry algorithms of the C++ library CGAL (Computational Geometry Algorithms Library) with Swift. The framework allows users to compute the convex hull and volume of a set of 3D points, using the implementation of CGAL.

**Important:** This framework uses [Swift and C++ interoperability introduced by WWDC23](https://developer.apple.com/videos/play/wwdc2023/10172/?time=40).

## Features

- **Volume Computation**: Compute the volume of the convex hull formed by a set of 3D points.

## Installation

### Cocoapods

You want to add pod `CGALKit_Pods', '~> 0.0` similar to the following to your Podfile:
```
target 'MyApp' do
  pod 'CGALKit_Pods', '~> 0.0'
end
```
Then run a pod install inside your terminal, or from CocoaPods.app.
More details: https://cocoapods.org/pods/CGALKit_Pods

## Usage

To compute the convex hull and its volume using the CGALKit, you need to create a list of `Point3` objects and pass it to the `ConvexHull` class.

### Example:

```swift
import CGALKitSwift

// Define points
let points: [Point3] = [
    Point3(x: 0.0, y: 0.0, z: 0.0),
    Point3(x: 1.0, y: 0.0, z: 0.0),
    Point3(x: 0.0, y: 1.0, z: 0.0),
    Point3(x: 0.0, y: 0.0, z: 1.0)
]

// Create ConvexHull instance
let convexHull = ConvexHull(from: points)

// Compute volume of the convex hull
let volume = convexHull.volume()

print("Volume of the convex hull: \(volume)")
```
