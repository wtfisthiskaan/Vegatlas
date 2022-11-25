//
//  RestaurantModel.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation
import MapKit

struct Restaurant: Identifiable{
    var id = UUID()
    var name: String
    var longitude: Double
    var latitude: Double
    var averageRating : Double
    var workingHours : String
    var description: String
    var menu: [Food]
    var comments: [Comment]
    var restaurantType : String
}
