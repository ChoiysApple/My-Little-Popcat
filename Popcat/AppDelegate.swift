//
//  AppDelegate.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit
import AVFAudio

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        // Get the singleton instance.
       let audioSession = AVAudioSession.sharedInstance()
       do {
           // Set the audio session category, mode, and options.
        try audioSession.setCategory(.ambient, options: .mixWithOthers)
       } catch {
           print("Failed to set audio session category.")
       }
        
        // Init UserDefault data at First launch
        let dataManager = UserDataManager()
        // Only at First launch
        let isNotFirstLaunch = dataManager.getIsInitialLaunch()
        if !isNotFirstLaunch {
            dataManager.setIsInitialLaunch(isFirst: true)
            
            dataManager.setCatData(catData: defaultAssetData)
            dataManager.setPopSoundVolume(volume: 1.0)
            
            // Initialize unlock cat data
            var unlockCatData: [String:Bool] = [:]
            for cat in AssetDataList{
                unlockCatData.updateValue(false, forKey: cat.catName)
            }
            unlockCatData.updateValue(true, forKey: defaultAssetData.catName)
            dataManager.setUnlockData(unlockedCat: unlockCatData)
            
            dataManager.showAllData()
        }
       
       // Other post-launch configuration.
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

