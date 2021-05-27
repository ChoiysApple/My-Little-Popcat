//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/03.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

}
