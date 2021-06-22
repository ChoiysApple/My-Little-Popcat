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

        self.cellImage.image = UIImage(named: catData.mainImageName)
        self.cellName.text = catData.catName
        self.cellView.backgroundColor = UIColor(named: "BgColor")
        
        // Make border of CollectionView Cell for selected Cell
        if currentCatName == catData.catName{
            self.cellView.layer.borderWidth = 1.5
        } else {
            self.cellView.layer.borderWidth = 0.5
        }
        
        self.cellView.layer.borderColor = UIColor(named: "Color")?.cgColor
        self.cellImage.alpha = 1.0
        
    }
    
    //
    private func setUnlockedView() {
        self.cellView.layer.borderWidth = 0.0
        self.cellView.backgroundColor = .systemGray6
        self.cellName.text = "899/1000"
        self.cellImage.image = UIImage(named: "locked_cat")
        self.cellImage.alpha = 0.5
        self.isUserInteractionEnabled = false
    }
    
}
