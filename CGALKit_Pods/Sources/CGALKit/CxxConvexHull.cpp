//
//  CxxConvexHull.cpp
//  CGALKit
//
//  Created by Kathryn Verkhogliad on 17.11.2024.
//

#include "CxxConvexHull.hpp"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/convex_hull_3.h>
#include <CGAL/Polyhedron_3.h>
#include <CGAL/Polygon_mesh_processing/measure.h>
#include <vector>
#include <iostream>

typedef CGAL::Exact_predicates_inexact_constructions_kernel K;
typedef K::Point_3 Point_3;
typedef CGAL::Polyhedron_3<K> Polyhedron;
typedef std::vector<Point_3> PointCloud;

double computeVolume(double** points, unsigned nPoints) {
    PointCloud pointCloud;
    
    for (unsigned i = 0; i < nPoints; i++) {
        pointCloud.emplace_back(Point_3(points[i][0], points[i][1], points[i][2]));
    }
    
    Polyhedron P;
    
    CGAL::convex_hull_3(pointCloud.begin(), pointCloud.end(), P);
    
    return CGAL::Polygon_mesh_processing::volume(P);
}

