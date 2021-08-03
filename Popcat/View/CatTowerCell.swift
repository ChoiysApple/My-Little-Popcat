//
//  CatTowerCell.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/03.
//

import UIKit

class CatTowerCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func initCell(catData: AssetData, currentCatName: String) {
        
        let dataManager = UserDataManager()
        let unlockData = dataManager.getUnlockData()
        
        // if cat is locked, diable cell
        if unlockData[catData.catName] == false {
            setViewDisabled(catData: catData)
            return
        }

        self.cellImage.image = UIImage(named: catData.mainImageName)
        self.cellName.text = catData.catName.localized
        self.cellView.backgroundColor = UIColor(named: "BgColor")
        
        // Make border of CollectionView Cell for selected Cell
        if currentCatName.localized == catData.catName.localized {
            self.cellView.layer.borderWidth = 2.5
        } else {
            self.cellView.layer.borderWidth = 0.75
        }
        
        self.cellView.layer.borderColor = UIColor(named: "Color")?.cgColor
        self.cellImage.alpha = 1.0
        self.cellName.alpha = 1.0
        self.isUserInteractionEnabled = true
        
        
    }
    
    //
    private func setViewDisabled(catData: AssetData) {
        self.cellView.layer.borderWidth = 0.0
        self.cellView.backgroundColor = .systemGray6
        self.cellName.text = "\(catData.unlockThreshold) Taps"
        self.cellName.alpha = 0.5
        self.cellImage.image = UIImage(named: "locked_cat")?.withAlignmentRectInsets(UIEdgeInsets(top: -15, left: 15, bottom: 0, right: 15))
        self.cellImage.alpha = 0.5
        self.isUserInteractionEnabled = false
    }
    
}
