//
//  NotView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct NotView: View {
    var body: some View {
        NavigationView {
            Text("notifications")
                .navigationBarTitle("Notifications", displayMode: .inline)
                .toolbarBackground(Color("Green"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct NotView_Previews: PreviewProvider {
    static var previews: some View {
        NotView()
    }
}
