//
//  OnboardingPage.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/28.
//

import Foundation
import OnboardKit

func getOnboardingViewController(onboardingDataList: [OnboardingDataModel]) ->  OnboardViewController {
    
    var pageItems: [OnboardPage] = []
    
    for onboardingData in onboardingDataList {
        
        pageItems.append(getOnbaordingView(onboardingData: onboardingData))
    }
    
    let appearance = OnboardViewController.AppearanceConfiguration(tintColor: UIColor(named: "AccentColor") ?? .blue,
                                             titleColor: UIColor(named: "Color") ?? .black,
                                             textColor: UIColor(named: "Color") ?? .black,
                                             backgroundColor: UIColor(named: "BgColor") ?? .white,
                                             imageContentMode: .scaleAspectFit,
                                             titleFont: UIFont.boldSystemFont(ofSize: 32.0),
                                             textFont: UIFont.boldSystemFont(ofSize: 17.0))
    
    
    
    return OnboardViewController(pageItems: pageItems, appearanceConfiguration: appearance)
}

// Create Onboarding view using OnboardingDataModel
func getOnbaordingView(onboardingData: OnboardingDataModel) -> OnboardPage {
    
    return OnboardPage(title: onboardingData.title, imageName: onboardingData.imageName, description: onboardingData.description)
}
