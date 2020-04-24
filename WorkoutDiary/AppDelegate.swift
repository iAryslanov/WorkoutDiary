//
//  AppDelegate.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 15.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible() // Made window main and displayable.
//        let rootViewController = ViewController()
//        window?.rootViewController = UINavigationController(rootViewController: ViewController())
//        let tabBarController = UITabBarController()
//        tabBarController.setViewControllers([rootViewController], animated: true)
        
        print("Приложение загружено")
        return true
    }
    
 func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Приложение практически загружено")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Приложение перешло в состояние Active")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Приложение перешло в состояние Inactive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Приложение перешло в бэкграунд")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Приложение вернулось в состояние Inactive")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Приложение сейчас будет выгружено из памяти")
    }
   

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "WorkoutDiary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

