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
            FavoriteView(restaurants: [Restaurant(name: "Rulo Lezzetler", longitude: 0.0, latitude: 0.0, averageRating: 4.5, workingHours: "08.00 - 23.00", description: "This is vegan restaurant", menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")], comments: [Comment(userFullName: "kaan", commentDate: "02.11.2022 23.43", text: "this is the best restaurant i have ever gone", rating: 5.0)], restaurantType: "vegan")])
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
