//
//  ProfileView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTIES
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        
        
        NavigationView {

            
            VStack(alignment: .center, spacing: 0){
              // MARK: - HEADER
                HStack(alignment: .top, spacing: 20) {
                Image(systemName: "person.fill")
                  .resizable()
                  .scaledToFit()
                  .padding(.top)
                  .frame(width: 100, height: 100, alignment: .center)
                  .clipShape(Circle())
                  .shadow(radius: 10)
                  .overlay(Circle().stroke(Color.black, lineWidth: 5))


                Text("Bahadir Kilinc")
                  .foregroundColor(Color.black)
              }
              .padding()
              
              Form {

                
                // MARK: - SECTION #2
                  //dummy data, will be changed.
                Section(header: Text("Account")) {
                  
                    HStack {
                      Text("Full Name").foregroundColor(Color.gray)
                      Spacer()
                      Text("Bahadir Kilinc")
                      
                    }
                    HStack {
                      Text("E-mail").foregroundColor(Color.gray)
                      Spacer()
                      Text("dummy123@gmail.com")
                    }
                    HStack {
                      Text("Phone Number").foregroundColor(Color.gray)
                      Spacer()
                      Text("123456789")
                    }
                    HStack {
                      Text("Change Password").foregroundColor(Color.gray)
                      Spacer()
                        NavigationLink("") {
                            EmptyView()
                        }
                        
                    }
                    
                      
                    HStack {
                      Text("Version").foregroundColor(Color.gray)
                      Spacer()
                      Text("1.5.0")
                    }
                  
                }
                  Section {
                      HStack{
                          Spacer()
                          Button("Log out") {
                              //log out case
                          }
                          .foregroundColor(.red)
                          Spacer()
                              
                      }
                  }
              }
            }
            .frame(maxWidth: 640)
            .navigationBarTitle("Account", displayMode: .inline)
            .toolbarBackground(Color("Green"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        }
        


    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
