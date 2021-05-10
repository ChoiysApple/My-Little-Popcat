//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/16.
//

import UIKit

class CatTowerVeiwController: UIViewController {

    @IBOutlet weak var popCountSwitch: UISwitch!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchState = UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
        popCountSwitch.setOn(switchState, animated: false)
        
        collectionView.register(UINib(nibName: "CatTowerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        setupFlowLayout(numberOfCells: 2.0)
    }

    
    @IBAction func doneButtonClicked(_ sender: UIButton) {

        let isLabelVisible = self.popCountSwitch.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
        

        
        self.dismiss(animated: false)
    
    }
}

extension CatTowerVeiwController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatTowerCell
        
        cell.cellImage.image = #imageLiteral(resourceName: "popcat_closed")
        cell.cellName.text = "Popcat"

        return cell
    }
    

}

extension CatTowerVeiwController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 45.0
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width * 0.95, height: width * 0.95)
    }
    
    
    private func setupFlowLayout(numberOfCells: CGFloat) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)

        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        self.collectionView.collectionViewLayout = flowLayout
    }
}

extension CatTowerVeiwController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CatTowerCell = collectionView.cellForItem(at: indexPath) as! CatTowerCell
        
    }
}

