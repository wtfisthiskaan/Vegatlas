//
//  NotDetailView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 2.12.2022.
//

import SwiftUI

struct NotDetailView: View {
    var notification: Notifications
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
                Text(notification.title)
                .font(.title2)
                .fontWeight(.bold)
                
                Text(String(notification.date))
                    .font(.footnote)
            }
            
            Text(notification.text)
            .font(.caption)
            .foregroundColor(Color.secondary)
        }
      } //: HSTACK
    }
}

//struct NotDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotDetailView()
//    }
//}
