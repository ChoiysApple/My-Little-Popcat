//
//  UserDataManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/25.
//

import Foundation

class UserDataManager {
    
    let userDefault = UserDefaults.standard
    
    func setCatData(catData: AssetData?) {
        
        let newData = catData ?? defaultAssetData
        userDefault.set(newData.catName, forKey: UserDataKey.currentCatName)
        userDefault.set(newData.openedImageName, forKey: UserDataKey.touchDownImage)
        userDefault.set(newData.closedImageName, forKey: UserDataKey.touchUpImage)
        userDefault.set(newData.mainImageName, forKey: UserDataKey.mainImage)
        userDefault.set(newData.audioSourceName, forKey: UserDataKey.popSound)
    }
    
    func setPopCount(popCount: Int) {
        userDefault.set(popCount, forKey: UserDataKey.popCount)
    }
    
    func setPopVisibility(popVisibility: Bool) {
        userDefault.set(popVisibility, forKey: UserDataKey.popCountVisibility)
    }

    
    
    
    func getCatData() -> AssetData {
        let newCatName = userDefault.string(forKey: UserDataKey.currentCatData) ?? defaultAssetData.catName
        let newClosedImageName = userDefault.string(forKey: UserDataKey.touchUpImage) ?? defaultAssetData.closedImageName
        let newOpenedImageName = userDefault.string(forKey: UserDataKey.touchDownImage) ?? defaultAssetData.openedImageName
        let newMainImageName = userDefault.string(forKey: UserDataKey.currentCatData) ?? defaultAssetData.mainImageName
        let newAudioSourceName = userDefault.string(forKey: UserDataKey.currentCatData) ?? defaultAssetData.audioSourceName
        
        return AssetData(catName: newCatName, closedImageName: newClosedImageName, openedImageName: newOpenedImageName, mainImageName: newMainImageName, audioSourceName: newAudioSourceName)
    }
    
    func getPopCount() -> Int {
        return userDefault.integer(forKey: UserDataKey.popCount)
    }
    
    func getPopVisibility() -> Bool {
        return userDefault.bool(forKey: UserDataKey.popCountVisibility)
    }
    
}
