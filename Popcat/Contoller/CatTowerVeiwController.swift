//
//  SettingsViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/16.
//

import UIKit

class CatTowerVeiwController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var popCountSwitch: UISwitch!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables for imageView
    private var selectedCatData: AssetData?
    private var currentCatName = ""
    
    private var dataManager = UserDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Pop Count switch state
        let switchState = dataManager.getPopVisibility()
        popCountSwitch.setOn(switchState, animated: false)
        
        collectionView.register(UINib(nibName: "CatTowerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        setupFlowLayout()
        
        currentCatName = dataManager.getCatData().catName
    }
    
    // Reload collectionView at orientation Changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }

}

//MARK: IBActions
extension CatTowerVeiwController {
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {

        // Send pop count visibility option  to UserDefaults
        let isLabelVisible = self.popCountSwitch.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
        
        // Send cat option to UserDefaults
        if let changedCatData = selectedCatData {
            if changedCatData.catName != dataManager.getCatData().catName {
                
                dataManager.setCatData(catData: changedCatData)
            }
        }
        
        self.dismiss(animated: false)
    }
}

//MARK: CollectionView Data Source
extension CatTowerVeiwController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AssetDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatTowerCell
        let catData = AssetDataList[indexPath.row]

        cell.cellImage.image = UIImage(named: catData.mainImageName)
        cell.cellName.text = catData.catName
        
        // Make border of CollectionView Cell
        if currentCatName == catData.catName{
            cell.cellView.layer.borderWidth = 1.5
        } else {
            cell.cellView.layer.borderWidth = 0.5
        }

        return cell
    }
    

}

//MARK: COllectionViewFlowLayout
extension CatTowerVeiwController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let leftAndRightPaddings: CGFloat = 45.0
        let numberOfItemsPerRow: CGFloat = numberOfCells
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width * cellSizeRatio, height: width * cellSizeRatio)
    }
    
    
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)

        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        self.collectionView.collectionViewLayout = flowLayout
    }
}

//MARK: CollectionViewDelegate
extension CatTowerVeiwController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CatTowerCell
        
        guard let selectedCatName = cell!.cellName.text else {
            return
        }
        
        if selectedCatName != currentCatName {
            selectedCatData = AssetDataList[indexPath.row]
            currentCatName = selectedCatName
            collectionView.reloadData()
        }
    }
}
