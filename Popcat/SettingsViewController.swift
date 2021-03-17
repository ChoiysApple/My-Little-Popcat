//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/16.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func popCountVisiabilitySwitch(_ sender: UISwitch) {
        let isLabelVisible = sender.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
