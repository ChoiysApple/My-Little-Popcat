//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/03.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellId = Identifier.SettingsTableViewCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SettingsVolumeCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @IBAction func backButtonClicked (_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }

}

extension SettingsViewController: UITableViewDataSource {
    
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Volume"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Volume of Poping sound"
    }
    
    
    // Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! SettingsVolumeCell
        
        return cell
    }
    
    
    
}
