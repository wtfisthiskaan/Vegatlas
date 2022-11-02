//
//  UserInfos.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import Foundation

class UserInfos: ObservableObject{
    @Published var hasLoggedIn = false
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var eatBehavior = ""
}
