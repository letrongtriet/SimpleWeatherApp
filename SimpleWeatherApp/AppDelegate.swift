//
//  AppDelegate.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let hostingVC = UIHostingController(rootView: MainView())
        window?.rootViewController = hostingVC
        window?.makeKeyAndVisible()
        return true
    }
}
