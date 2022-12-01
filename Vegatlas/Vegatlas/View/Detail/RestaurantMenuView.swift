//
//  RestaurantMenuView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 1.12.2022.
//

import SwiftUI

struct RestaurantMenuView: View {
  // MARK: - PROPERTIES
  
    var menu: [Food]

  // MARK: - BODY

  var body: some View {
    GroupBox() {
        
       
      DisclosureGroup("Menu") {
        ForEach(0..<menu.count, id: \.self) { item in
          Divider().padding(.vertical, 2)
          
          HStack {
            Group {
              Image(systemName: "fork.knife")
                Text(menu[item].name)
                    //.foregroundColor(Color("Purple"))
            }
            //.foregroundColor(fruit.gradientColors[1])
            .font(Font.system(.body).bold())
            
            Spacer(minLength: 25)
            
              Text(menu[item].price + "₺")
              .multilineTextAlignment(.trailing)
          }
        }
      }
      .foregroundColor(.black)
      .fontWeight(.bold)
      
    } //: BOX
  }
}

struct RestaurantMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMenuView(menu: [Food(name: "Falafel", price: "20"), Food(name: "Nohut", price: "20")])
    }
}
