//
//  RestaurantDetailView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 25.11.2022.
//

import SwiftUI
import Firebase

struct RestaurantDetailView: View {
    // MARK: - PROPERTIES
    
    var restaurant: Restaurant
    
    @State var isLiked: Bool = false
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    RestaurantHeaderView(restaurant: restaurant)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        HStack{
                            Text(restaurant.name)
                            
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("Purple"))
                            
                            Spacer()
                            Button {
                                if !isLiked{
                                    let db = Firestore.firestore()
                                    let documentRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
                                    documentRef.updateData([
                                        "favorites": FieldValue.arrayUnion([restaurant.name])
                                    ])
                                }else{
                                    let db = Firestore.firestore()
                                    let documentRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
                                    documentRef.updateData([
                                        "favorites": FieldValue.arrayRemove([restaurant.name])
                                    ])
                                }
                                isLiked.toggle()
                            } label: {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(Color("Green"))
                                    .font(.system(size: 24))
                            }
                            
                        }
                        
                        
                        // HEADLINE
                        Text(restaurant.description)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // NUTRIENTS
                        RestaurantMenuView(menu: restaurant.menu)
                        
                        // SUBHEADLINE
                        //            Text("Learn more about \(fruit.title)".uppercased())
                        //              .fontWeight(.bold)
                        //              .foregroundColor(fruit.gradientColors[1])
                        //
                        //            // DESCRIPTION
                        //            Text(fruit.description)
                        //              .multilineTextAlignment(.leading)
                        
                    } //: VSTACK
                    .padding(.top ,70)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                //.navigationBarTitle(fruit.title, displayMode: .inline)
                //.navigationBarHidden(true)
            } //: SCROLL
            .edgesIgnoringSafeArea(.top)
        } //: NAVIGATION
        .onAppear{
            isLiked = favRestaurants.contains(restaurant.name)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Rulo Lezzetler", longitude: 0.0, latitude: 0.0, averageRating: 4.5, workingHours: "08.00 - 23.00", description: "This is vegan restaurant", menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")], comments: [Comment(userFullName: "kaan", commentDate: "02.11.2022 23.43", text: "this is the best restaurant i have ever gone", rating: 5.0)], restaurantType: "vegan"))
    }
}
