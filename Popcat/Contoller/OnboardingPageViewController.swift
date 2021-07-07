//
//  OnboardingPage.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/28.
//

import Foundation
import OnboardKit
import UIKit

func getOnboardingViewController(onboardingDataList: [OnboardingDataModel]) ->  OnboardViewController {
    
    var pageItems: [OnboardPage] = []
    
    for onboardingData in onboardingDataList {
        
        pageItems.append(getOnbaordingView(onboardingData: onboardingData))
    }
    
    let advanceButtonStyling: OnboardViewController.ButtonStyling = { button in
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-medium", size: 25.0)!
        button.backgroundColor = UIColor(named: "AccentColor")!
        button.layer.cornerRadius = 10
        button.setTitle("Next".localized, for: .normal)
        
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
    }
    
    let appearance = OnboardViewController.AppearanceConfiguration(
        tintColor: UIColor(named: "AccentColor")!,
        titleColor: UIColor(named: "Color")!,
        textColor: UIColor(named: "Color")!,
        backgroundColor: UIColor(named: "BgColor")!,
        imageContentMode: .scaleAspectFit,
        titleFont: UIFont(name: "AvenirNext-medium", size: 32.0)!,
        textFont: UIFont(name: "Avenir", size: 20.0)!,
        advanceButtonStyling: advanceButtonStyling
    )
    
    

    let onboardVC = OnboardViewController(pageItems: pageItems, appearanceConfiguration: appearance)
    onboardVC.modalPresentationStyle = .fullScreen
    
    return onboardVC
}

// Create Onboarding view using OnboardingDataModel
func getOnbaordingView(onboardingData: OnboardingDataModel) -> OnboardPage {
    
    return OnboardPage(title: onboardingData.title, imageName: onboardingData.imageName, description: onboardingData.description)
}
