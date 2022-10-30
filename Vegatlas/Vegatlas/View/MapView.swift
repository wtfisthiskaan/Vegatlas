//
//  MapView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI
import MapKit
struct MapView: View {
    var body: some View {
        NavigationView{
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.989044, longitude: 29.023411), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))))
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
