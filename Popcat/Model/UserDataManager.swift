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

    func setIsInitialLaunch(isFirst: Bool) {
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
        
        var catData = defaultAssetData
        do {
            catData = try userDefaults.getObject(forKey: UserDataKey.currentCatData, castTo: AssetData.self)
        } catch {
            print("\(String(describing: self)): \(error.localizedDescription)")
        }
        
        return catData
    }
    
    func getPopCount() -> Int {
        return userDefaults.integer(forKey: UserDataKey.popCount)
    }
    
    func getPopVisibility() -> Bool {
        return userDefaults.bool(forKey: UserDataKey.popCountVisibility)
    }
    
    func getIsInitialLaunch() -> Bool {
        return userDefaults.bool(forKey: UserDataKey.isNotFirstLaunch)
    }
    
    func getPopSoundVolume() -> Float{
        return userDefaults.float(forKey: UserDataKey.popVolume)
    }
    
    func getUnlockData() -> [String:Bool]{
        return userDefaults.dictionary(forKey: UserDataKey.unlockedCat) as! [String:Bool]
    }
}
