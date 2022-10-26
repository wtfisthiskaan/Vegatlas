//
//  MapView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        NavigationView {
            Text("map")
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
