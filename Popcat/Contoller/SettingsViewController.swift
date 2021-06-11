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
        return SettingsSection.allCases.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .volume: return VolumeOption.allCases.count
        case .About: return AboutOption.allCases.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        
//        switch section {
//        case .volume:
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//            return cell
//        case .About:
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//            cell.textLabel?.text = AboutOption(rawValue: indexPath.row)!.description
//            cell.textLabel?.textColor = .black
//            cell.backgroundColor = .systemGray6
//            return cell
//        }
        

        return SettingsVolumeCell()
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let description = SettingsSection(rawValue: section)?.headerDescription else {
            return tableViewSectionHeaderView(description: "")
        }
        
        return tableViewSectionHeaderView(description: description)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        guard let description = SettingsSection(rawValue: section)?.footerDescription else {
            return tableViewSectionHeaderView(description: "")
        }
        
        return tableViewSectionFooterView(description: description)

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 40
    }
}
