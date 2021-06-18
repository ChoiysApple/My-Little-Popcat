//
//  DeveloperInfoViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/16.
//

import UIKit

class DeveloperInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = DeveloperInfo.name
        descriptionLabel.text = DeveloperInfo.description
        
        tableView.isScrollEnabled = false
    }
    
}

extension DeveloperInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DeveloperInfoSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: Identifier.DeveloperPageCell)
        guard let section = DeveloperInfoSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        cell.textLabel?.text = section.title
        cell.detailTextLabel?.text = section.subtitle
        cell.imageView?.image = UIImage(named: section.imageSourceName)
        cell.imageView?.layer.cornerRadius = 13
        cell.imageView?.layer.masksToBounds = true
        cell.backgroundColor = .none
        
        return cell
    }
    
}

extension DeveloperInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = DeveloperInfoSection(rawValue: indexPath.section) else { return }
        
        if let url = URL(string: section.pageURL) {
            UIApplication.shared.open(url)
        }
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section != DeveloperInfoSection.allCases.count - 1 {
            return 10
        }else{
            return 0
        }

    }
}
