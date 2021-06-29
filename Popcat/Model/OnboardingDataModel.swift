//
//  OnboardingData.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/28.
//

import Foundation

struct OnboardingDataModel {
    var title: String
    var imageName: String
    var description: String
}

enum OnboardingData: Int, CaseIterable {
    case mainView, catTowerView
    
    var onboardingDataList: [OnboardingDataModel] {
        switch self {
        case .mainView: return mainViewOnboarding
        case .catTowerView: return catTowerViewOnboarding
        }
    }
}

let mainViewOnboarding = [
    OnboardingDataModel(title: "Tap Anywhere", imageName: "tap_gesture", description: "Tap anywhere to get relexed"),
    OnboardingDataModel(title: "Swipe Up", imageName: "swipe_up", description: "Swipe Up and Check more cats")
]

let catTowerViewOnboarding = [
    OnboardingDataModel(title: "Welcome to Cat Tower", imageName: "cat_tower", description: "You can pick various cats. Here"),
    OnboardingDataModel(title: "More taps, More cats", imageName: "cat_face", description: "More cats will be unlocked as you tap more")
]
