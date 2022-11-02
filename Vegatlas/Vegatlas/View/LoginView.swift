//
//  LoginView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 25.10.2022.
//

import SwiftUI

struct LoginView: View {
    @Binding var hasLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage = ""
    @State private var isThereError = false
    @State private var isPopUpPresented = false
    var body: some View {
        
        ZStack{
            Color("Green")
            VStack{
                
                Image("vegatlas_logo")
                    .resizable()
                    .frame(width: 213, height: 80)
                    .padding(.top, 150)
                    .padding(.bottom, 90)
                
                TextField("E-Mail", text: $email)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 10)
                SecureField("Password", text: $password)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 60)
                Button {
                    // check the email and password from database then get the user information
                    if email.isEmpty{
                        isThereError.toggle()
                        errorMessage = "E-Mail could not be empty."
                    }else if password.isEmpty{
                        isThereError.toggle()
                        errorMessage = "Password could not be empty."
                    }else{
                        hasLoggedIn.toggle()
                        // firebase sign in
                    }
                } label: {
                    Text("Sign In")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(hasLoggedIn: .constant(false))
    }
}
