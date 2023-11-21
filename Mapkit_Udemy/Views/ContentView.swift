//
//  ContentView.swift
//  Mapkit_Udemy
//
//  Created by tom montgomery on 11/4/23.
//

import SwiftUI
import MapKit






struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    // since it's coming from @observable, needs to be @state
    @State private var locationManager = LocationManager.shared
    // TODO: benefit of private here?
    @State private var selectedStyle: MapOptions = .standard
    
    var body: some View {
        
        // wrap it in a ZStack so the MapOption picker can be on top
        // align zstack to .top so picker displays at the top
        ZStack(alignment: .top) {
            Map(position: $position) {
                // Markers are quick and easy
                // Annotations allow for more customization
                Marker("Coffee", coordinate: .coffee)
                Marker("Restaurant", coordinate: .restaraunt)
                
                Annotation("Blackwater Coffee Roasters", coordinate: .blackwater) {
                    // 'Content' trailing closure
                    Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                    // foregroundColor is deprecated
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .cornerRadius(4)
                }
                Annotation("Dels Diner", coordinate: .delsDiner) {
                    Image(systemName: "fork.knife.circle")
                        .padding(3)
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(6)
                }
                // Responsible for displaying the user's location
                // run on the simulator, preview doesn't always work
                UserAnnotation()
            }
            .mapStyle(selectedStyle.mapStyle)
            // must conform to Equatable to fire onChange
            .onChange(of: locationManager.region) {
                withAnimation {
                    // wrap in withAnimation
                    // TODO:  doesn't seem to make a diff, map still moves with blue dot either way
                                    position = .region(locationManager.region)
                }

            }
            Picker("Map Style", selection: $selectedStyle) {
                // conforms to caseIterable so it works nicely in a forEach
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }
            .pickerStyle(.segmented)
            // set to white so it's not transparent, but it applies above it hiding the map, sooo - add padding to allow it to not block the unsafe area
            .background(.white)
            // sweet hack ^^^
            .padding()
        }

    }
}

#Preview {
    ContentView()
}
