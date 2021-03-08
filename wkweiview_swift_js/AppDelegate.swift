//
//  AppDelegate.swift
//  wkweiview_swift_js
//
//  Created by lee on 2021/3/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.backgroundColor = UIColor.white;
        window = UIWindow(frame: UIScreen.main.bounds);
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

    

}

