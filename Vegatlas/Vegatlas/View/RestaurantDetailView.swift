//
//  RestaurantDetailView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 25.11.2022.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack{
            Image(systemName: "fork.knife.circle")
                .font(.system(size: 108))
            HStack{
                VStack{
                    Text(restaurant.name)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        
                    Text(restaurant.description)
                        .fontWeight(.heavy)
                        .font(.caption)
                }
                VStack{
                    Text(restaurant.workingHours)
                    Text(restaurant.restaurantType)
                }
           
                
            }
            Text("Menu")
                .font(.largeTitle)
                .fontWeight(.bold)
              
            ForEach(restaurant.menu) { food in
                
                HStack{
                    Text(food.name)
                    Spacer()
                    Text(food.price)
                }

                
            }
            
            Text("Comments")
                .fontWeight(.bold)
                .font(.largeTitle)
            ForEach(restaurant.comments) { comment in
                
                VStack{
                    HStack{
                        Text(comment.userFullName)
                            .fontWeight(.bold)
                        Spacer()
                    }
              
                    Text(comment.text)
                    Text(String(format: "rating %.1f", comment.rating))
                    Text(comment.commentDate)

        
                    
                    Spacer()
          
                }
                
                
            }


            Spacer()
            
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Rulo Lezzetler", longitude: 0.0, latitude: 0.0, averageRating: 4.5, workingHours: "08.00 - 23.00", description: "This is vegan restaurant", menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")], comments: [Comment(userFullName: "kaan", commentDate: "02.11.2022 23.43", text: "this is the best restaurant i have ever gone", rating: 5.0)], restaurantType: "vegan"))
    }
}
