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





struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.989044, longitude: 29.023411), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $region, annotationItems: annotations) { restaurant in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)) {
                    NavigationLink {
                        RestaurantDetailView(restaurant: restaurant)
                    } label: {
                        Image(systemName: "fork.knife.circle.fill")
                    }

                }
                

                
                    
                    
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
        .onAppear{
            DispatchQueue.main.async {
                FirebaseManager.getRestaurantData(completionHandler: { data in
                    annotations = data!
                })
            }
        }
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
