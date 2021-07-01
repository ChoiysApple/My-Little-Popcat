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
    
    var cell: UITableViewCell {
        switch self {
        case .volume: return SettingsVolumeCell()
        }
    }
}

enum AboutOption: Int, CaseIterable {
    
    case version, developer, artist
    
    var description: String {
        switch self {
        case .version: return "Version"
        case .developer: return "Developer Info"
        case .artist: return "Art of My Little Popcat"
        }
    }
    
    var cell: UITableViewCell {
        switch self {
        case .version:
            let cell = SettingsInfoOnlyCell()
            cell.textLabel?.text = self.description
            cell.subLabel.text = currentVersion
            return cell
        case .developer:
            let cell = SettingsDiscolsureCell()
            cell.textLabel?.text = self.description
            return cell
        case .artist:
            let cell = SettingsDiscolsureCell()
            cell.textLabel?.text = self.description
            return cell
        }
    }
}

