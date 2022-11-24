//
//  UserInfos.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import Foundation

class UserInfos: ObservableObject{
    @Published var hasLoggedIn = false
    @Published var fullName: String = "bahadir etka"
    @Published var email: String = "abcdefg@123.com"
    @Published var phoneNumber: String = "12345678"
    @Published var password: String = "1234566"
    @Published var eatBehavior = ""
}
