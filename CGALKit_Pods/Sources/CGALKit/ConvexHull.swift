//
//  CGAL_API.swift
//  CGALKit
//
//  Created by Kathryn Verkhogliad on 17.11.2024.
//

//import CxxConvexHull

/**
 A structure that represents a Point in 3D space.
 */
public struct Point3 {
    public let coordX: Double
    public let coordY: Double
    public let coordZ: Double

    /**
     Initializes a new `Point3` with given 3D coordinates.
     
     - Parameters:
         - x: Abscissa of the point.
         - y: Ordinate of the point.
         - z: Applicate of the point.
    */
    public init(x coordX: Double, y coordY: Double, z coordZ: Double) {
        self.coordX = coordX
        self.coordY = coordY
        self.coordZ = coordZ
    }
}

/**
 A class that represents a convex hull in 3D space.

 This class takes an array of ``Point3`` objects and allows further computations based on them.
 
 - Important: This class uses raw pointers to store and manage points.
              Make sure to handle memory management carefully when using this class.
 - Note: This class is built upon `CGAL` C++ library.
 */
public class ConvexHull {
    /// A pointer to an array of pointers that store the coordinates of points.
    private let pPoints: UnsafeMutablePointer<UnsafeMutablePointer<Double>?>

    /// The number of points in the convex hull.
    private let pointCount: Int

    /**
     Initializes a new instance of `ConvexHull` with an array of `Point3` objects.

     - Parameter from : An array of `Point3` objects representing the points in 3D space.

     - Note: The class uses raw memory management.
             Each point is stored as a pointer to an array of `Double` values representing
             the coordinates (`coordX`, `coordY`, `coordZ`).
     */
    public init(from points: [Point3]) {
        self.pointCount = points.count

        self.pPoints = UnsafeMutablePointer<UnsafeMutablePointer<Double>?>.allocate(capacity: pointCount)

        for (index, point) in points.enumerated() {
            let innerPointer = UnsafeMutablePointer<Double>.allocate(capacity: 3)

            innerPointer[0] = point.coordX
            innerPointer[1] = point.coordY
            innerPointer[2] = point.coordZ

            self.pPoints[index] = innerPointer
        }
    }

    /**
     Computes the volume of the convex hull formed by the points.
     
     - Returns: A `Double` representing the volume of the convex hull.
     
     - Note: The volume computation relies on `CGAL` C++ library.
     */
    public func volume() -> Double {
        return computeVolume(self.pPoints, UInt32(self.pointCount))
    }

    /**
     Deallocates the memory used by the `ConvexHull` instance.
     
     This method is called automatically when the object is deallocated to clean up allocated memory
     for the point array.
     */
    deinit {
        // Deallocate memory for each point
        for index in 0..<pointCount {
            self.pPoints[index]?.deallocate()
        }

        // Deallocate memory for the points array
        self.pPoints.deallocate()
    }
}
