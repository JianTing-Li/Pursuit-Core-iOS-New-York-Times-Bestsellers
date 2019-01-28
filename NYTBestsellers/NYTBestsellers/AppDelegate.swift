//
//  AppDelegate.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
/*
     BVC.title = "NYT Best Sellers"
     BVC.tabBarItem = UITabBarItem.init(title: "NYT Best Sellers", image: UIImage(named: "icons8-open_book"), selectedImage: UIImage(named: "icons8-open_book_filled"))
     FVC.title = "Favorites"
     FVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(named: "icons8-add_to_favorites"), selectedImage: UIImage(named: "icons8-add_to_favorites_filled"))
     SVC.title = "Settings"
     SVC.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage(named: "icons8-settings"), selectedImage: UIImage(named: "icons8-settings_filled"))
     let controllers = [BVC, FVC, SVC]
     tab.viewControllers = controllers.map{UINavigationController(rootViewController: $0)}
*/
    let mainViewController = NYTBestSellingController()
    mainViewController.title = "NYT Bestsellers"
    mainViewController.tabBarItem = UITabBarItem.init(title: "Bestsellers", image: UIImage(named: "icons8-best_seller"), selectedImage: UIImage(named: "icons8-best_seller_filled"))
    
    let favoriteVC = FavoriteViewController()
    favoriteVC.title = "Favorites"
    favoriteVC.view.backgroundColor = .blue
    favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    
    let settingVC = SettingViewController()
    settingVC.title = "Default Category"
    settingVC.view.backgroundColor = .yellow
    settingVC.tabBarItem = UITabBarItem.init(title: "Setting", image: UIImage(named: "icons8-settings"), selectedImage: UIImage(named: "icons8-settings_filled"))
    
    let tab = UITabBarController()
    tab.viewControllers = [mainViewController, favoriteVC, settingVC]
    
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.rootViewController = tab
    window?.makeKeyAndVisible()
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

