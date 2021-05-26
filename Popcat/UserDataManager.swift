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
            print(error.localizedDescription)
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
    
    
    //MARK:- Getters
    func getCatData() -> AssetData {
        
        var catData = defaultAssetData
        do {
            catData = try userDefaults.getObject(forKey: UserDataKey.currentCatData, castTo: AssetData.self)
        } catch {
            print(error.localizedDescription)
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
    
}
