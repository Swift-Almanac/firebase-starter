//
//  AppDelegate + GoogleSignIn.swift
//  firebasebasicauth
//
//  Created by Mark Hoath on 22/1/18.
//  Copyright © 2018 Swift Almanac. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


extension AppDelegate: GIDSignInDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        guard let user = MyFirebase.shared.currentUser else {
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print (error)
                    return
                }
            }
            return
        }
        
        if (user.isAnonymous){
            MyFirebase.shared.linkCredential(credential: credential)
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
