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
        let myLabel = UILabel()
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.text = "Volume"
        myLabel.translatesAutoresizingMaskIntoConstraints = false

        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.font = UIFont.boldSystemFont(ofSize: 10)
        myLabel.text = "Volume"
        myLabel.translatesAutoresizingMaskIntoConstraints = false

        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
}
