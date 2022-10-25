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
        
        /*
         if user sign in directly main screen
         */
        
        
        
        
        
        /*
         if user has already account then go to sign in screen
         */
        LoginView()
        
        
        
        
        
//        /*
//         if user not sign up then go to sign up view
//         */
//
//        NavigationView {
//            RegisterViewOne()
//                .environmentObject(userInfo)
//
//        }
//        .accentColor(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
