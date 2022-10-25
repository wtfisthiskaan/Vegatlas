//
//  RegisterViewTwo.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color("Purple") : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct RegisterViewTwo: View {
    @EnvironmentObject var userInfo: UserInfos
    @State private var passwordCheck = ""
    @State private var term1 = false
    @State private var term2 = false

    var body: some View {
        
        ZStack{
            Color("Green")
            VStack{

                TextField("Phone Number", text: $userInfo.phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 10)
                SecureField("Password", text: $userInfo.password)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    
                SecureField("Confirm Password", text: $passwordCheck)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    
                Picker("Please Select",selection: $userInfo.eatBehavior) {
                    Text("Vegeterian")
                        .tag(1)
                    Text("Vegan")
                        .tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.top, 30)
                .padding()
                
                HStack{
                    CheckBoxView(checked: $term1)
                    Text("I accept to Term, Privacy Policy and Cookie use ")
                        .font(.system(size: 12))
                        .onTapGesture {
                            term1.toggle()
                        }
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack{
                    CheckBoxView(checked: $term2)
                    Text("I agree to get Commercial Messages from application")
                    
                        .font(.system(size: 12))
                        .onTapGesture {
                            term2.toggle()
                        }
    
                    Spacer()
                }
                .padding(.bottom, 60)
                NavigationLink {
                    // continue
                } label: {
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(Color("Green"))
                        .font(.system(.title3, weight: .heavy))
                }
                .frame(maxWidth: .infinity)
                .background {
                    Color(.white)
                }
                .cornerRadius(30)
                


                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct RegisterViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewTwo()
    }
}
