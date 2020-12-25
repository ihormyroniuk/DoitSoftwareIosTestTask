//
//  AppDelegate.swift
//  DoitSoftwareIosTestTask
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import UIKit
import DoitSoftwareTestApi

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let addingNewUser = AddingNewUser(email: "email1@email.email", password: "password1")
//        Interactors.interactor.addNewUser(addingNewUser: addingNewUser) { (result) in
//
//        }
//        Interactors.interactor.authorizeUserByCredentials(addingNewUser: addingNewUser) { (result) in
//
//        }
//        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOm51bGwsImF1ZCI6bnVsbCwiaWF0IjoxNjA4OTA1NzUzLCJuYmYiOjE2MDg5MDU3NTMsImV4cCI6MTYwODk5MjE1Mywic3ViIjo1NTF9.YtdcXQF-BpaUET0_4XVUsVJW_mMMw2pXu6q7-nVuqwo"
//        let creatingTask = CreatingTask(token: token, title: "title3", dueBy: 3, priority: .low)
//        Interactors.interactor.createTask(creatingTask: creatingTask) { (result) in
//
//        }
//        let gettingTasksList = GettingTasksList(token: token, page: 0)
//        Interactors.interactor.getTasksList(gettingTasksList: gettingTasksList) { (result) in
//
//        }
//        let gettingTaskDetails = GettingTaskDetails(token: token, task: 3080)
//        Interactors.interactor.getTaskDetails(gettingTaskDetails: gettingTaskDetails) { (result) in
//
//        }
//        let updatingTask = UpdatingTask(token: token, id: 3080, title: "title3ppppp", dueBy: nil, priority: nil)
//        Interactors.interactor.updateTask(updatingTask: updatingTask) { (result) in
//
//        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

