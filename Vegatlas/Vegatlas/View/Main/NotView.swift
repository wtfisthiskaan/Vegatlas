//
//  NotView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI
import Firebase
struct NotView: View {
    @State var notifications = [Notifications]()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(notifications) { notification in
                    NotDetailView(notification: notification)
                }
            }
            .toolbarBackground(Color("Green"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem() {
                    Image("nots_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .onAppear{
            FirebaseManager.getNotifications { data in
                self.notifications = data!
            }
        }
    }
    
}

struct NotView_Previews: PreviewProvider {
    static var previews: some View {
        NotView()
    }
}
