//
//  UserDataManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/25.
//

import Foundation

class UserDataManager {
    
    private let userDefaults = UserDefaults.standard
    
    //MARK:- Setters
    func setCatData(catData: AssetData?) {
        do {
            try userDefaults.setObject(catData, forKey: UserDataKey.currentCatData)
        } catch {
            print("\(String(describing: self)): \(error.localizedDescription)")
        }
        
    }
    
    func setPopCount(popCount: Int) {
        userDefaults.set(popCount, forKey: UserDataKey.popCount)
    }
    
    func setPopVisibility(popVisibility: Bool) {
        userDefaults.set(popVisibility, forKey: UserDataKey.popCountVisibility)
    }

    func setIsNotInitialLaunch(isFirst: Bool) {
        userDefaults.set(isFirst, forKey: UserDataKey.isNotFirstLaunch)
    }
    
    func setPopSoundVolume(volume: Float){
        userDefaults.set(volume, forKey: UserDataKey.popVolume)
    }
    
    func setUnlockData(unlockedCat: [String:Bool]){
        userDefaults.set(unlockedCat, forKey: UserDataKey.unlockedCat)
    }
    
    
    //MARK:- Getters
    func getCatData() -> AssetData {
        
        if !isKeyPresentInUserDefaults(key: UserDataKey.currentCatData) {
            setCatData(catData: defaultAssetData)
            return defaultAssetData
        }
        
        var catData = defaultAssetData
        do {
            catData = try userDefaults.getObject(forKey: UserDataKey.currentCatData, castTo: AssetData.self)
        } catch {
            print("\(String(describing: self)): \(error.localizedDescription)")
        }
        
        return catData
    }
    
    func getPopCount() -> Int {
        
        if isKeyPresentInUserDefaults(key: UserDataKey.popCount){
            return userDefaults.integer(forKey: UserDataKey.popCount)
        } else {
            setPopCount(popCount: 0)
            return 0
        }
    }
    
    func getPopVisibility() -> Bool {

        if isKeyPresentInUserDefaults(key: UserDataKey.popCountVisibility){
            return userDefaults.bool(forKey: UserDataKey.popCountVisibility)
        } else {
            setPopVisibility(popVisibility: false)
            return false
        }
    }
    
    func getIsNotInitialLaunch() -> Bool {
        
        if isKeyPresentInUserDefaults(key: UserDataKey.isNotFirstLaunch){
            return userDefaults.bool(forKey: UserDataKey.isNotFirstLaunch)
        } else {
            setIsNotInitialLaunch(isFirst: false)
            return false
        }
    }
    
    func getPopSoundVolume() -> Float{
        
        return userDefaults.float(forKey: UserDataKey.popVolume)
    }
    
    func getUnlockData() -> [String:Bool]{
        
        if isKeyPresentInUserDefaults(key: UserDataKey.unlockedCat) {
            return userDefaults.dictionary(forKey: UserDataKey.unlockedCat) as! [String:Bool]
        } else {
            // Create & set default data
            var unlockCatData: [String:Bool] = [:]
            for cat in AssetDataList{
                unlockCatData.updateValue(false, forKey: cat.catName)
            }
            unlockCatData.updateValue(true, forKey: defaultAssetData.catName)
            setUnlockData(unlockedCat: unlockCatData)

            return unlockCatData
        }
    }
    
    func showAllData() {
        print("Cat: \(self.getCatData())")
        print("Count: \(self.getPopCount())")
        print("Visibility: \(self.getPopVisibility())")
        print("Is Initial Launch: \(self.getIsNotInitialLaunch())")
        print("Volume: \(self.getPopSoundVolume())")
        print("Unlocked: \(self.getUnlockData())")
    }
    
    // Check is UserDefaults has data for certain key
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
}
