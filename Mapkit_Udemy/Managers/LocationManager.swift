//
//  LocationManager.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/11/23.
//

import Foundation
import MapKit

@MainActor class LocationManager {
    // Needs to be performed on the main actor (main thread)
    
    
    // use a singleton - shared instance of LocMgr
    static let shared = LocationManager()
    
    // the REAL LocMgr
    let manager: CLLocationManager
    
    init() {
        // initialize the location manager
        self.manager = CLLocationManager()
        print(self.manager.authorizationStatus.rawValue)
        // check if we've been authorized or not
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
}
