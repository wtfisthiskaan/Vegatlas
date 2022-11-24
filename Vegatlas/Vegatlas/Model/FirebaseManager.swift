//
//  FirebaseManager.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.11.2022.
//

import Foundation
import Firebase

struct FirebaseManager{
    
    static func getUserData(completionHandler: @escaping ([String : Any]?) -> Void){
        let db = Firestore.firestore()
        DispatchQueue.main.async() {
            let docRef = db.collection("Users").document(Auth.auth().currentUser?.uid ?? "")
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    completionHandler(document.data())
                }
            }
        }
    }
}
