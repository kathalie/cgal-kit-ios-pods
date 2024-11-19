//
//  CxxConvexHull.hpp
//  CGALKit
//
//  Created by Kathryn Verkhogliad on 17.11.2024.
//

#pragma once

// IMPORTANT: Disables usage of GMP, only uses Boost
#define CMAKE_OVERRIDDEN_DEFAULT_ENT_BACKEND BOOST_BACKEND

double computeVolume(double** points, unsigned nPoints);
