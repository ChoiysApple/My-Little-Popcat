//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/16.
//

import UIKit

class SettingsViewController: UIViewController {

    var manager = SettingDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func popCountVisiabilitySwitch(_ sender: UISwitch) {
        let isLabelVisible = sender.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        
        self.dismiss(animated: true){
            
            if let vc = self.storyboard!.instantiateViewController(withIdentifier: Identifier.mainViewController) as? MainViewController{
                    vc.updateSettings()
               }
//            print("dismissed")
//            self.manager.updateSettings()
        }
    
    }
}
