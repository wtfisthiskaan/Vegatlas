//
//  AddCommentView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 25.11.2022.
//

import SwiftUI

struct AddCommentView: View {
    @State private var commentText = ""
    @State private var rating = 0
    // restoran ismi alcak
    // user ismi alinacak
    var body: some View {
        VStack{
            TextField("Enter the comment ", text: $commentText)
                .modifier(Title())
            Picker("Rate",selection: $rating) {
                Text("1")
                    .tag(1)
                Text("2")
                    .tag(2)
                Text("3")
                    .tag(3)
                Text("4")
                    .tag(4)
                Text("5")
                    .tag(5)
            }
            .pickerStyle(.segmented)
            
            Button {
                // firebase add comment to database
                // database'e yazilmadan once current date alinacak
            } label: {
                Text("Save")
            }


            
        }
    }
}

struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView()
    }
}
