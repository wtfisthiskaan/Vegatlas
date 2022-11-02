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
    @State private var logAccount = false
    var body: some View {
        
        /*
         if user sign in directly main screen
         */
        if userInfo.hasLoggedIn{
            
            MainAppView()
            
        }
        else {
        if hasAccount{
            LoginView(hasLoggedIn: $userInfo.hasLoggedIn)
            }
        else{
            NavigationView {
                RegisterViewOne(hasAccount: $hasAccount)
                .environmentObject(userInfo)
                    
                }
                .accentColor(.black)
            }
        }
        /*
         if user has already account then go to sign in screen
         */
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
