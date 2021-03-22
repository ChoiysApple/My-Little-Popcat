//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/16.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var popCountSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchState = UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
        popCountSwitch.setOn(switchState, animated: false)
    }

    
    @IBAction func doneButtonClicked(_ sender: UIButton) {

        let isLabelVisible = self.popCountSwitch.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
        
        self.dismiss(animated: false)
    
    }
}
