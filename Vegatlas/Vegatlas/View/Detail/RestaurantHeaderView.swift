//
//  RestaurantHeaderView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 1.12.2022.
//

import SwiftUI

struct RestaurantHeaderView: View {
  // MARK: - PROPERTIES
  
  var restaurant: Restaurant
  
  @State private var isAnimatingImage: Bool = false

  // MARK: - BODY

  var body: some View {
    ZStack {
        
      Image("vegan_food")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .padding(.vertical, 20)
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
    } //: ZSTACK
    .frame(height: 240)
    .onAppear() {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimatingImage = true
      }
    }
  }
}

struct RestaurantHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantHeaderView(restaurant: Restaurant(name: "Rulo Lezzetler", longitude: 0.0, latitude: 0.0, averageRating: 4.5, workingHours: "08.00 - 23.00", description: "This is vegan restaurant", menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")], comments: [Comment(userFullName: "kaan", commentDate: "02.11.2022 23.43", text: "this is the best restaurant i have ever gone", rating: 5.0)], restaurantType: "vegan"))
    }
}
