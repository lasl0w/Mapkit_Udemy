//
//  LocationManager.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/11/23.
//

import Foundation
import MapKit
// TODO: is the observation import redundant?
import Observation

// HA!  in iOS 17 we no longer need @PUblished and ObservableObject - syntactic sugar...
/// instead, use the @observable macro
// TODO: don't need @MainActor any more.  not sure why
@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    // Needs to be performed on the main actor (main thread)
    // in order to focus on users location - conform to both NSObject & CLLocationMgrDelegate
    // the Delegate contains a lot of functions to manage events and errors
    
    // use a singleton - shared instance of LocMgr
    static let shared = LocationManager()
    // the REAL LocMgr
    let manager: CLLocationManager = CLLocationManager()
    // need a region for the map camera placement - sets zoom level.  @Observable - the whole thing is published
    var region: MKCoordinateRegion = MKCoordinateRegion()
    
    // now that we are conforming to NSObject, need to 'override'
    override init() {
        // call the parent (NSObject) init first
        super.init()
        // assign the delegate to our class, so we can implement the firing events - didUpdate...
        self.manager.delegate = self
        print(self.manager.authorizationStatus.rawValue)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // MOVED THIS LOGIC TO locationManagerDidChangeAuthorization
        // check if we've been authorized or not
        //if self.manager.authorizationStatus == .notDetermined {
        //self.manager.requestWhenInUseAuthorization()
        // request location once - eventually fires didUpdateLocations
        //self.manager.requestLocation()
        // request location continuously
        //self.manager.startUpdatingLocation()
        //}
        // Don't need the 'else if' .  If the person DENIED the map, then requestLocation() just doesn't do much
        //else if self.manager.authorizationStatus == .authorizedWhenInUse || self.manager.authorizationStatus == .authorizedAlways {
        // we already have perms - carry on
        //self.manager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // automatically fires when the init is run
        print("DidChangeAuthorization Fired")
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied:
            print("Denied")
        case .restricted:
            print("Restricted")
        @unknown default:
            // Covers for future statuses in future versions of iOS
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // just get the last location
        let today = Date.now
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        
        locations.last.map {
            // need to create an MKCoordinateRegion based on the last location - for the map camera to use
            print(formatter.string(from: today) + ": Fired didUpdateLocation")
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            // Hey - we got a new region, update the map camera view!
            // must conform to observable object to start publishing this
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handle as needed, but first step is to print to the console
        print(error)
    }
    
}
