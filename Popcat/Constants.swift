//
//  Constants.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/09.
//

import Foundation

struct audioFileName {
    static let popOriginal = "popcat_original_sound"
}

struct Identifier {
    static let settingSegue = "mainToSettings"
    static let mainViewController = "MainViewController"
}

struct UserDataKey {
    static let isNotFirstLaunch = "not_first_launch"
    static let popCount = "pop_count"
    static let popCountVisibility = "count_label_visibility"
    static let currentCatName = "current_cat"
    static let touchDownImage = "touchdown_image"
    static let touchUpImage = "touchup_image"
    static let popSound = "pop_sound"
    static let background = "background"
}

let AssetData = [
    ["catName": "Pop Cat", "closedImageName": "popcat_closed", "openedImageName": "popcat_opened", "mainImageName": "popcat_closed"],
    ["catName": "Original Cat", "closedImageName": "originalcat_closed", "openedImageName": "originalcat_opened", "mainImageName": "originalcat_closed"],
    ["catName": "Hood Cat", "closedImageName": "hoodcat_closed", "openedImageName": "hoodcat_opened", "mainImageName": "hoodcat_opened"]
]
