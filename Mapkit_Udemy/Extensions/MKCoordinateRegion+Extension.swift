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
    
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if (lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == rhs.span.longitudeDelta) {
            // it's the same map position, they are equal
            return true
    } else {
                return false
        }
    }
}
