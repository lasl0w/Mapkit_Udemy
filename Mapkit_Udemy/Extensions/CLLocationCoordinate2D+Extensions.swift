//
//  CLLocationCoordinate2D+Extensions.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/11/23.
//

import Foundation
import MapKit
// included CLLocationCoordinate2D

// Could create extension in a separate file
extension CLLocationCoordinate2D {
    static var coffee: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 30.011180, longitude: -95.512560)
    }
    static var restaraunt: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 29.682113464413725, longitude: -95.32003124532574)
    }
    static var blackwater: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 29.7100286994373, longitude: -95.40200048683435)
    }
    static var delsDiner: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 29.79049526619233, longitude: -95.16206086090111)
    }
}
