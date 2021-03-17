//
//  settingDataManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/17.
//

import Foundation

protocol updateSettingDelegate {
    func updateViewSettings()
}

class SettingDataManager {
    var delegate: updateSettingDelegate?
    
    func updateSettings(){
        print("manager run")
        delegate?.updateViewSettings()
    }
    
    
}
