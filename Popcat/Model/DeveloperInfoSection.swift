//
//  DeveloperInfoSection.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/17.
//

import Foundation

enum DeveloperInfoSection: Int, CaseIterable {
    case github, testflight
    
    var title: String {
        switch self {
        case .github: return "GitHub"
        case .testflight: return "TestFlight"
        }
    }
    
    var subtitle: String {
        switch self {
        case .github: return "Visit GitHub page for more"
        case .testflight: return "Try next version in advanced"
        }
    }
    
    var imageSourceName: String {
        switch self {
        case .github: return "Github_logo"
        case .testflight: return "testflight_logo"
        }
    }
}
