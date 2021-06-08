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
        
        self.tableView.register(SettingsVolumeCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @IBAction func backButtonClicked (_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }

}

//MARK: -UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsVolumeCell
        
        return cell
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return tableViewSectionHeaderView(description: "Volume")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return tableViewSectionFooterView(description: "Volume settings")
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 40
    }
}
