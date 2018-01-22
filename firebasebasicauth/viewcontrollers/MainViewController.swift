//
//  MainViewController.swift
//  firebasebasicauth
//
//  Created by Mark Hoath on 22/1/18.
//  Copyright © 2018 Swift Almanac. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class MainViewController: UIViewController, GIDSignInUIDelegate {
    
    let logOutBtn = UIButton(frame: CGRect(x: 120, y: 300, width: 200, height: 30))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        logOutBtn.setTitle("LogOut", for: .normal)
        logOutBtn.setTitleColor(.black, for: .normal)
        logOutBtn.adjustsImageWhenHighlighted = true
        logOutBtn.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
        view.addSubview(logOutBtn)
    }

    @objc func logOut() {

        MyFirebase.shared.logOut()
    }

}
