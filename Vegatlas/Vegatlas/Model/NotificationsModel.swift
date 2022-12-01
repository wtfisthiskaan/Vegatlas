//
//  NotificationsModel.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation

struct Notifications: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var text: String
}
