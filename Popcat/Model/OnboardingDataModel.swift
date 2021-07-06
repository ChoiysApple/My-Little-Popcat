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
    OnboardingDataModel(title: "Tap Anywhere".localized, imageName: "tap_gesture", description: "Tap anywhere to get relexed".localized),
    OnboardingDataModel(title: "Swipe Up".localized, imageName: "swipe_up", description: "Swipe Up to Check more cats and settings".localized)
]

let catTowerViewOnboarding = [
    OnboardingDataModel(title: "Welcome to Cat Tower".localized, imageName: "cat_tower", description: "You can pick various cats here".localized),
    OnboardingDataModel(title: "More taps, More cats".localized, imageName: "cat_face", description: "More cats will be unlocked as you tap more".localized)
]
