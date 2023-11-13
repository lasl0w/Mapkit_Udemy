//
//  MapOptions.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/11/23.
//

import Foundation
//
import SwiftUI
import MapKit


// Identifiable so you can use it in a view easier
// TODO: what are the reqs to comply with CaseIterable
enum MapOptions : String, Identifiable, CaseIterable {
    
    case standard
    case hybrid
    case imagery
    
    // set the ID to conform to identifiable.
    var id: String {
        self.rawValue
    }
    
    var mapStyle: MapStyle {
        switch self {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        }
    }
}
