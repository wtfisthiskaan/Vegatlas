//
//  FavoriteView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI
import Firebase
struct FavoriteView: View {
  
    @State var restaurants = [Restaurant]()
    var body: some View {
      NavigationView {
        List {
          ForEach(restaurants) { item in
            NavigationLink(destination: RestaurantDetailView(restaurant: item)) {
              FavoriteRowView(restaurant: item)
                .padding(.vertical, 4)
            }
          }
        }
        .navigationTitle("Favorites")
      } //: NAVIGATION
      .onAppear{
          DispatchQueue.main.async {
              restaurants.removeAll()
              FirebaseManager.getUserData { data in
                  favRestaurants = data?["favorites"] as! [String]
              }
              favRestaurants.forEach { rest in
                  let r = annotations.filter{$0.name == rest}.first
                  restaurants.append(r!)
              }
          }
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct FavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteView()
//    }
//}
