//
//  MKCoordinateRegion+Extension.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/14/23.
//

import Foundation
// must have for MKCoordinateRegion - MK, it's in the name!
import MapKit

extension MKCoordinateRegion: Equatable {
    // What is a REGION??  It's a center point and a span (which defines the zoom level)
    
    
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if (lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == rhs.span.longitudeDelta) {
            // it's the same map position, they are equal
            return true
    } else {
                return false
        }
    }
    
    // TODO:  Map quick ref - basic distances of lat/long Meters "0.01 is about 1 block"
    static var coffee : MKCoordinateRegion {
        MKCoordinateRegion(center: .coffee, latitudinalMeters: 100, longitudinalMeters: 100)
    }
    
    static var restaurant: MKCoordinateRegion {
        MKCoordinateRegion(center: .restaraunt, latitudinalMeters: 100, longitudinalMeters: 100)
    }
}
