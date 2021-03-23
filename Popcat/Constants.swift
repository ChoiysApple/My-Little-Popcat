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

struct imageFileName {
    static let originalOpen = "popcat_opened"
    static let originalClosed = "popcat_closed"
}

struct Identifier {
    static let settingSegue = "mainToSettings"
    static let mainViewController = "MainViewController"
}

struct UserDataKey {
    static let isNotFirstLaunch = "not_first_launch"
    static let popCount = "pop_count"
    static let popCountVisibility = "count_label_visibility"
    static let touchDownImage = "touchdown_image"
    static let touchUpImage = "touchup_image"
    static let popSound = "pop_sound"
    static let background = "background"
}
