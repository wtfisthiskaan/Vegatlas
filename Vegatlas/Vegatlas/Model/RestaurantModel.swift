//
//  RestaurantModel.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation
import MapKit

class Restaurant: ObservableObject,Identifiable{
    var id = UUID()
    var name: String = ""
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var averageRating : Double = 0.0
    var workingHours : String = ""
    var description: String = ""
    var menu = [Food]()
    var comments = [Comment]()
    var restaurantType : String = ""
    @Published var isLiked = false
    init(id: UUID = UUID(), name: String, longitude: Double, latitude: Double, averageRating: Double, workingHours: String, description: String, menu: [Food] = [Food](), comments: [Comment] = [Comment](), restaurantType: String) {
        self.id = id
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.averageRating = averageRating
        self.workingHours = workingHours
        self.description = description
        self.menu = menu
        self.comments = comments
        self.restaurantType = restaurantType
    }
}
