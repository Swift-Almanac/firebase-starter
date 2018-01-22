//
//  MyFirebase.swift
//  firebasebasicauth
//
//  Created by Mark Hoath on 22/1/18.
//  Copyright © 2018 Swift Almanac. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class MyFirebase {
    
    static let shared = MyFirebase()
    
    var currentUser: User?
    var userId: String = ""
    var dbRef: DatabaseReference! = Database.database().reference()
    
    private var listenHandler: AuthStateDidChangeListenerHandle?
    
    private init() {
        
    }
    
    func addUserListener(loggedIn: Bool) {
        print ("Add listener")
        listenHandler = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                // We are Logged Out
                print("Logged Out")
                self.currentUser = nil
                self.userId = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    if loggedIn {
                        moveToMainWindow()
                    } else {
                        moveToLoginWindow()
                    }
                }
            }
            else {
                print ("Logged In")
                self.currentUser = user
                self.userId = (user?.uid)!
                
                // LOAD ANY DATA HERE
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    moveToMainWindow()
                }
            }
        }
    }
    
    func removeUserListener() {
        guard listenHandler != nil else {
            return
        }
        Auth.auth().removeStateDidChangeListener(listenHandler!)
    }
}
