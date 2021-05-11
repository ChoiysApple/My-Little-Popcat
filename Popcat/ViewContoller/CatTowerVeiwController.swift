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
    
    var selectedCatData: [String:String]?
    let currentCatName = UserDefaults.standard.string(forKey: UserDataKey.currentCatName)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchState = UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
        popCountSwitch.setOn(switchState, animated: false)
        
        collectionView.register(UINib(nibName: "CatTowerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        setupFlowLayout()
    }

    
    @IBAction func doneButtonClicked(_ sender: UIButton) {

        // Send pop count visibility option  to UserDefaults
        let isLabelVisible = self.popCountSwitch.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
        
        
        // Send cat option to UserDefaults
        if let changedCatData = selectedCatData {
            if changedCatData["catName"] != UserDefaults.standard.string(forKey: UserDataKey.currentCatName) {
                UserDefaults.standard.set(changedCatData["catname"], forKey: UserDataKey.currentCatName)
                UserDefaults.standard.set(changedCatData["openedImageName"], forKey: UserDataKey.touchDownImage)
                UserDefaults.standard.set(changedCatData["closedImageName"], forKey: UserDataKey.touchUpImage)
            }
        }
        
        self.dismiss(animated: false)
    
    }
}

extension CatTowerVeiwController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AssetData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatTowerCell
        let catData = AssetData[indexPath.row]

        cell.cellImage.image = UIImage(named: catData["mainImageName"] ?? "popcat_closed")
        cell.cellName.text = catData["catName"]

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
    
    
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)

        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        self.collectionView.collectionViewLayout = flowLayout
    }
}

extension CatTowerVeiwController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedCatData = AssetData[indexPath.row]
    }
}
