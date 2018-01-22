//
//  GlobalFunctions.swift
//  firebasebasicauth
//
//  Created by Mark Hoath on 22/1/18.
//  Copyright © 2018 Swift Almanac. All rights reserved.
//

import UIKit

func moveToSplashScreen() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = SplashViewController()
}

func moveToLoginWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = LoginViewController()
}


func moveToMainWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = MainViewController()
}

func moveToSettingsWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    
    let settingsVC = SettingsViewController()
    let navController = UINavigationController(rootViewController: settingsVC)
    
    appDelegate.window?.rootViewController = navController
}

