//
//  FavoriteRowView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 1.12.2022.
//

import SwiftUI

struct FavoriteRowView: View {
    var restaurant: Restaurant
    var body: some View {
      HStack {
        Image("vegan_food")
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
          .background(
            LinearGradient(gradient: Gradient(colors: [Color("Gray")]), startPoint: .top, endPoint: .bottom)
          )
          .cornerRadius(8)

        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(restaurant.name)
                .font(.title2)
                .fontWeight(.bold)
                
                Text(String(restaurant.averageRating))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            }
            
            Text(restaurant.description)
            .font(.caption)
            .foregroundColor(Color.secondary)
        }
      } //: HSTACK
    }
}

struct FavoriteRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRowView(restaurant: Restaurant(name: "Rulo Lezzetler", longitude: 0.0, latitude: 0.0, averageRating: 4.5, workingHours: "08.00 - 23.00", description: "This is vegan restaurant", menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")], comments: [Comment(userFullName: "kaan", commentDate: "02.11.2022 23.43", text: "this is the best restaurant i have ever gone", rating: 5.0)], restaurantType: "vegan"))
    }
}
