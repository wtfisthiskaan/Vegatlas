//
//  ContentView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userInfo = UserInfos()
    @State private var hasAccount = false
    var body: some View {
        
        /*
         if user sign in directly main screen
         */
        
        
        
        
        
        /*
         if user has already account then go to sign in screen
         */
        if hasAccount{
            LoginView()

        }
        else{
            NavigationView {
                RegisterViewOne(hasAccount: $hasAccount)
                    .environmentObject(userInfo)
                
            }
            .accentColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
