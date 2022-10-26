//
//  FavoriteView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            Text("favorites")
                .navigationBarTitle("Favorites", displayMode: .inline)
                .toolbarBackground(Color("Green"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
