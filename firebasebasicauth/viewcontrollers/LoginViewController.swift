//
//  LoginViewController.swift
//  firebasebasicauth
//
//  Created by Mark Hoath on 22/1/18.
//  Copyright © 2018 Swift Almanac. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    let googleLoginBtn = GIDSignInButton(frame: CGRect(x: 120, y: 250, width: 200, height: 30))
    let anonLoginBtn = UIButton(frame: CGRect(x: 120, y: 300, width: 200, height: 30))


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        anonLoginBtn.setTitle("Anonymous Login", for: .normal)
        anonLoginBtn.adjustsImageWhenHighlighted = true
        anonLoginBtn.addTarget(self, action: #selector(signInAnon), for: .touchUpInside)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        view.addSubview(googleLoginBtn)
        view.addSubview(anonLoginBtn)

    }

    @objc func signInAnon() {
        MyFirebase.shared.signInAnonymous()

    }
    
}
