//
//  UserModel.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation

struct User {
    var fullName: String
    var phoneNumber: String
    var eatBehavior: String
    var notifications: [Notifications]
    var favorites: [Restaurant]
    
    
}

