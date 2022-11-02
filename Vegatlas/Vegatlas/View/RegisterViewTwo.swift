//
//  RegisterViewTwo.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

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
    @State private var errorMessage = ""
    @State private var isThereError = false
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
                        .tag("Vegeterian")
                    Text("Vegan")
                        .tag("Vegan")
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
                Button {
                    
                    if self.userInfo.phoneNumber.isEmpty{
                        isThereError.toggle()
                        errorMessage = "Phone number could not be empty."
                    }else if userInfo.password != self.passwordCheck{
                        isThereError.toggle()
                        errorMessage = "Passwords does not match."
                    }else if userInfo.password.isEmpty{
                        isThereError.toggle()
                        errorMessage = "Password can not be empty."
                    }else if userInfo.eatBehavior.isEmpty{
                        isThereError.toggle()
                        errorMessage = "You have to select eat behavior."
                    
                    }else if !term1 || !term2{
                        isThereError.toggle()
                        errorMessage = "You have to accept the terms"
                    }else{
                        userInfo.hasLoggedIn.toggle()
                    }
                } label: {
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(Color("Green"))
                        .font(.system(.title3, weight: .heavy))
                }
                .alert(errorMessage, isPresented: $isThereError){
                    Button {
                        isThereError = false
                    } label: {
                        Text("OK")
                    }

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
