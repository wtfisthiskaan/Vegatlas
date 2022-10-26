//
//  ProfileView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("profile")
                .navigationBarTitle("Profile", displayMode: .inline)
                .toolbarBackground(Color("Green"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
        

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
