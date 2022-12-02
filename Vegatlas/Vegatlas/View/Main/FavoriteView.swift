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
        .navigationBarTitle("Favorites", displayMode: .inline)
        .toolbarBackground(Color("Green"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
      } //: NAVIGATION
      .onAppear{
          DispatchQueue.main.async {
              restaurants.removeAll()
              FirebaseManager.getUserData { data in
                  if(data == nil){
                      favRestaurants = [""]
                  }
                  else{
                      if(data!["favorites"] != nil){
                          favRestaurants = data?["favorites"] as! [String]
                      }
                      else{
                          favRestaurants = [""]
                      }
                  }
              }
              favRestaurants.forEach { rest in
                  if rest != nil{
                      let r = annotations.filter{$0.name == rest}.first
                      if(r != nil){
                          restaurants.append(r!)
                      }
                  }
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
