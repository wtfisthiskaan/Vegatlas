//
//  CommentModel.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation

struct Comment: Identifiable{
    var id = UUID()
    var userFullName: String
    var commentDate: String
    var text: String
    var rating: Double
}
