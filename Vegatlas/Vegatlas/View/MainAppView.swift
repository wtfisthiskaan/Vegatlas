//
//  MainAppView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var userInfo: UserInfos
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("Gray"))
       // UITabBar.appearance().barTintColor = UIColor(Color("Green"))
       }
    
    var body: some View {
        TabView {
          MapView()
            .tabItem({
              Image(systemName: "map.fill")
              Text("Map")
            })
          FavoriteView()
            .tabItem({
                Image(systemName: "heart.fill")
              Text("Favorites")
            })
          NotView()
            .tabItem({
              Image(systemName: "bell.fill")
              Text("Notification")
            })
            ProfileView(hasLoggedIn: $userInfo.hasLoggedIn)
            .tabItem({
              Image(systemName: "person.fill")
              Text("Account")
            })
        }
        .accentColor(Color("Purple"))
       
    }
}



struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
