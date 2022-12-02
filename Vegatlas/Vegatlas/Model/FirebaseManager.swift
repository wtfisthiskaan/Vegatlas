//
//  FirebaseManager.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation
import Firebase

var favRestaurants = [String]()
var annotations = [Restaurant]()


struct FirebaseManager{
    
    static func getUserData(completionHandler: @escaping ([String : Any]?) -> Void){
        let db = Firestore.firestore()
        DispatchQueue.main.async() {
            
            //let docRef = db.collection("Users").document(Auth.auth().currentUser?.uid ?? "")
            
            let uid = Auth.auth().currentUser?.uid ?? ""
            let docRef = db.collection("Users")
            if(uid != ""){
            let userDoc = docRef.document(uid)
            userDoc.getDocument { (document, error) in
                    if let err = error {
                             print(err.localizedDescription) //document did not exist
                             completionHandler(nil)
                         }
                    else if let document = document {
                        completionHandler(document.data())
                    }
                }
            
            }
            else{
                completionHandler(nil)
            }
            
        }
    }
    static func getNotifications(completionHandler: @escaping ([Notifications]?) -> Void){
        let db = Firestore.firestore()
        var notifications = [Notifications]()
        DispatchQueue.main.async() {
            let docRef = db.collection("Notifications")
            docRef.getDocuments { snapshot, error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    snapshot?.documents.forEach({ not in
                        notifications.append(Notifications(title: not["title"] as! String,
                                                           date: not["date"] as! String,
                                                           text: not["text"] as! String))
                    })
                    completionHandler(notifications)
                }
                
            }
        }
    }
    static func getRestaurantData(completionHandler: @escaping ([Restaurant]?) -> Void){
        var restaurants = [Restaurant]()
        let db = Firestore.firestore()
        DispatchQueue.main.async() {
            let docRef = db.collection("Restaurants")
            if(docRef == nil){
                completionHandler(nil)
            }
             
            docRef.getDocuments { snapshot, error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    snapshot?.documents.forEach({ restaurant in
                        let data = restaurant.data()
                        var rest = Restaurant(name: data["name"] as! String,
                                              longitude: data["lon"] as! Double,
                                              latitude: data["lat"] as! Double,
                                              averageRating: 0.0,
                                              workingHours: data["workingHours"] as! String,
                                              description: data["description"] as! String,
                                              restaurantType: data["restaurantType"] as! String)
                        func getRestaurant(handler: @escaping ([Restaurant]) -> Void){
                            docRef.document(rest.name).collection("menu").getDocuments { snapshot, error in
                                if let error = error{
                                    print(error.localizedDescription)
                                }else{
                                    snapshot?.documents.forEach({ food in
                                        let data = food.data()
                                        let foodName = data["food"] as! String
                                        let foodPrice = data["price"] as! String
                                        rest.menu.append(Food(name: foodName, price: foodPrice))
                                    })
                                    restaurants.append(rest)
                                    handler(restaurants)
                                }
                            }
                        }
                        getRestaurant { restaurants in
                            completionHandler(restaurants)
                        }
                    })
                }
            }
            
        }
        
        
    }
}
