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
    OnboardingDataModel(title: "Tap Anywhere", imageName: "popcat_closed", description: "Tap anywhere to get relexed"),
    OnboardingDataModel(title: "Swipe Up", imageName: "popcat_closed", description: "Swipe Up and Check more cats")
]

let catTowerViewOnboarding = [
    OnboardingDataModel(title: "Welcome to Cat Tower", imageName: "popcat_closed", description: "You can try various cats."),
    OnboardingDataModel(title: "More taps, More cats", imageName: "popcat_closed", description: "More cats will be unlocked as you tap more")
]
