//
//  UserDataManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/25.
//

import Foundation

class UserDataManager {
    
    //MARK:- Setters
    func setCatData(catData: AssetData?) {
        
        let newData = catData ?? defaultAssetData
        UserDefaults.standard.set(newData.catName, forKey: UserDataKey.currentCatName)
        UserDefaults.standard.set(newData.openedImageName, forKey: UserDataKey.touchDownImage)
        UserDefaults.standard.set(newData.closedImageName, forKey: UserDataKey.touchUpImage)
        UserDefaults.standard.set(newData.mainImageName, forKey: UserDataKey.mainImage)
        UserDefaults.standard.set(newData.audioSourceName, forKey: UserDataKey.popSound)
    }
    
    func setPopCount(popCount: Int) {
        UserDefaults.standard.set(popCount, forKey: UserDataKey.popCount)
    }
    
    func setPopVisibility(popVisibility: Bool) {
        UserDefaults.standard.set(popVisibility, forKey: UserDataKey.popCountVisibility)
    }

    func setIsInitialLaunch(isFirst: Bool) {
        UserDefaults.standard.set(isFirst, forKey: UserDataKey.isNotFirstLaunch)
    }
    
    
    //MARK:- Getters
    func getCatData() -> AssetData {
        
        let newCatName = UserDefaults.standard.string(forKey: UserDataKey.currentCatName) ?? defaultAssetData.catName
        let newClosedImageName = UserDefaults.standard.string(forKey: UserDataKey.touchUpImage) ?? defaultAssetData.closedImageName
        let newOpenedImageName = UserDefaults.standard.string(forKey: UserDataKey.touchDownImage) ?? defaultAssetData.openedImageName
        let newMainImageName = UserDefaults.standard.string(forKey: UserDataKey.mainImage) ?? defaultAssetData.mainImageName
        let newAudioSourceName = UserDefaults.standard.string(forKey: UserDataKey.popSound) ?? defaultAssetData.audioSourceName
        
        return AssetData(catName: newCatName, closedImageName: newClosedImageName, openedImageName: newOpenedImageName, mainImageName: newMainImageName, audioSourceName: newAudioSourceName)
    }
    
    func getPopCount() -> Int {
        return UserDefaults.standard.integer(forKey: UserDataKey.popCount)
    }
    
    func getPopVisibility() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
    }
    
    func getIsInitialLaunch() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDataKey.isNotFirstLaunch)
    }
    
}
