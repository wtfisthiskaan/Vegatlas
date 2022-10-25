//
//  ContentView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userInfo = UserInfos()
    var body: some View {
        NavigationView {
            RegisterViewOne()
                .environmentObject(userInfo)
            
        }
        .accentColor(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
