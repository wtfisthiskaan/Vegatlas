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
                    //DispatchQueue.main.async {
                        FirebaseManager.getUserData { data in
                            if data != nil{
                                favRestaurants = data?["favorites"] as! [String]
                            }else{
                                favRestaurants = [""]
                            }
                        }
                        
                        FirebaseManager.getRestaurantData(completionHandler: { data in
                            if(data == nil){
                                
                            }
                            else{
                                annotations = data!
                            }
                        })
                    //}
             
                }
        }
    }
}
