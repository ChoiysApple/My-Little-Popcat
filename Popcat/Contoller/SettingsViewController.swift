//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/03.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellId = Identifier.SettingsTableViewCell
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.attributedText = NSAttributedString(string: "Settings ⚙".localized)
        
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @IBAction func backButtonClicked (_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }

}

//MARK:- UITableViewDataSource
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
        case .Volume: return VolumeOption.allCases.count
        case .About: return AboutOption.allCases.count
        case .Guide: return GuideOption.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Volume:
            return VolumeOption.volume.cell
        case .About:
            return AboutOption(rawValue: indexPath.row)?.cell ?? UITableViewCell()
        case .Guide:
            return GuideOption(rawValue: indexPath.row)?.cell ?? UITableViewCell()
        }

    }
    
}

//MARK: TableView Header/Footer options
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
        
        return 70
    }
}

//MARK: Interaction
extension SettingsViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        if section == .About {
            if AboutOption.init(rawValue: indexPath.row) == .developer {
                openBottomSheet()
                tableView.cellForRow(at: indexPath)?.isSelected = false
            } else if AboutOption.init(rawValue: indexPath.row) == .artist {
                if let url = URL(string: "https://www.notion.so/choiysapple/326c1a6e1fd543c1adebd6ffdc3aeab8?v=d233d2a22a454a0ea178a5c6dcee3de6") {
                    UIApplication.shared.open(url)
                }
                tableView.cellForRow(at: indexPath)?.isSelected = false
            }
        } else if section == .Guide {
            if GuideOption.init(rawValue: indexPath.row) == .main {
                getOnboardingViewController(onboardingDataList: OnboardingData.mainView.onboardingDataList).presentFrom(self, animated: true)

                tableView.cellForRow(at: indexPath)?.isSelected = false
            } else if GuideOption.init(rawValue: indexPath.row) == .catTower {
                getOnboardingViewController(onboardingDataList: OnboardingData.catTowerView.onboardingDataList).presentFrom(self, animated: true)
                tableView.cellForRow(at: indexPath)?.isSelected = false
            }
        }
    }
    
    // Open bottom sheet
    private func openBottomSheet() {
        let viewController = storyboard?.instantiateViewController(withIdentifier: Identifier.DeveloperPageViewController) as! DeveloperInfoViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: viewController)
        bottomSheet.preferredContentSize = CGSize(width: self.view.frame.size.width, height: 360)
        present(bottomSheet, animated: true, completion: nil)
    }
}


