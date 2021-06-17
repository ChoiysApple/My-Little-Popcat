//
//  Constants.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/09.
//

import Foundation

struct Identifier {
    static let settingSegue = "mainToSettings"
    static let mainViewController = "MainViewController"
    static let SettingsTableViewCell = "SettingsCell"
    static let DeveloperPageViewController = "DeveloperView"
    static let DeveloperPageCell = "developerCell"
}

struct UserDataKey {
    static let isNotFirstLaunch = "not_first_launch"
    static let popCount = "pop_count"
    static let popCountVisibility = "count_label_visibility"
    
    static let currentCatData = "current_cat_data"
    
    static let currentCatName = "current_cat"
    static let touchDownImage = "touchdown_image"
    static let touchUpImage = "touchup_image"
    static let mainImage = "main_image"

    static let popSound = "pop_sound"
    static let popVolume = "pop_volume"
    
    static let background = "background"
}

var currentVersion: String {
    guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "unidentified" }
    let currentVersion: String = "\(version)"
    
    return currentVersion
}

