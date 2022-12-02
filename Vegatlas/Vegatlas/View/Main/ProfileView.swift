//
//  ProfileView.swift
//  Vegatlas
//
//  Created by Mete Varol on 26.10.2022.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    // MARK: - PROPERTIES
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    @Binding var hasLoggedIn: Bool
    
    @State private var userData: [String:Any]?
    var body: some View {
        
        // profile done

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
                        
                        
                        
                    }
                    .padding()
                    
                    Form {
                        
                        
                        // MARK: - SECTION #2
                        //dummy data, will be changed.
                        Section(header: Text("Account")) {
                            
                            HStack {
                                Text("Full Name").foregroundColor(Color.gray)
                                Spacer()
                                Text(userData?["fullName"] as? String ?? "" )
                                
                            }
                            HStack {
                                Text("E-mail").foregroundColor(Color.gray)
                                Spacer()
                                Text(Auth.auth().currentUser?.email ?? "")
                            }
                            HStack {
                                Text("Phone Number").foregroundColor(Color.gray)
                                Spacer()
                                Text(userData?["phoneNumber"] as? String ?? "" )
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
                                    do{
                                        try Auth.auth().signOut()
                                        hasLoggedIn.toggle()
                                    }catch let error{
                                        print(error.localizedDescription)
                                    }
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
            .onAppear(perform: {
                FirebaseManager.getUserData { data in
                    userData = data
                }
            })
    }
    
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(hasLoggedIn: .constant(true))
    }
}
