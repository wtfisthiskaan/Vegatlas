//
//  MapView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI
import MapKit


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
let annotations = [
        Location(name: "Rulo Lezzetler", coordinate: CLLocationCoordinate2D(latitude: 40.988471, longitude: 29.027615)),
        Location(name: "VeganArsist", coordinate: CLLocationCoordinate2D(latitude: 40.99160, longitude: 29.072880)),
]

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.989044, longitude: 29.023411), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $region, annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate,tint: Color("Green"))
            }
                .toolbarBackground(Color("Green"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem() {
                        Image("vegatlas_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
        }
        
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
