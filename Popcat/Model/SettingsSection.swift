//
//  SettingsSection.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/11.
//

import Foundation
import UIKit

enum SettingsSection: Int, CaseIterable {
    case volume, About
    
    var headerDescription: String {
        switch self {
        case .volume: return "Volume"
        case .About: return "About"
        }
    }
    
    var footerDescription: String {
        switch self {
        case .volume: return "Set pop sound Volume"
        case .About: return "Show Developer information"
        }
    }
}

enum VolumeOption: Int, CaseIterable {
    case volume
    
    var description: String {
        switch self {
        case .volume: return "Volume"
        }
    }
}

enum AboutOption: Int, CaseIterable {
    
    case version, developer
    
    var description: String {
        switch self {
        case .version: return "App Version"
        case .developer: return "Developer Info"
        }
    }
}

