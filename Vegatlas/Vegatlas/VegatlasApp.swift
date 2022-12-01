//
//  VegatlasApp.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI
import Firebase
@main
struct VegatlasApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    DispatchQueue.main.async {
                        FirebaseManager.getRestaurantData(completionHandler: { data in
                            annotations = data!
                        })
                        FirebaseManager.getUserData { data in
                            favRestaurants = data?["favorites"] as! [String]
                        }
                    }
             
                }
        }
    }
}
