//
//  AppDelegate.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/14.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        createTabBar()
        return true
    }

    func createTabBar() {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = BasicTabBarController()
        self.window?.makeKeyAndVisible()
        Thread.sleep(forTimeInterval: 2.0)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
}

