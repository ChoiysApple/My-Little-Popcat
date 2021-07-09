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
    @IBOutlet weak var popcountLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // Variables for imageView
    private var selectedCatData: AssetData?
    private var currentCatName = ""
    
    private var dataManager = UserDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Initialize Pop Count switch state
        let switchState = dataManager.getPopVisibility()
        popCountSwitch.setOn(switchState, animated: false)
        
        popcountLabel.text = "Show Pop count".localized
        doneButton.setAttributedTitle(NSAttributedString(string: "Done".localized), for: .normal)
        titleLabel.text = "Cat Tower 🐈".localized

        // CollectionView Settings
        collectionView.register(UINib(nibName: "CatTowerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        setupFlowLayout()
        
        currentCatName = dataManager.getCatData().catName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        if !dataManager.getIsNotInitialCatTower() {
            getOnboardingViewController(onboardingDataList: OnboardingData.catTowerView.onboardingDataList).presentFrom(self, animated: true)
            dataManager.setIsNotInitialCatTower(isFirst: true)
            dataManager.setIsNotInitialLaunch(isFirst: true)
        }
        

    }
    
    // Reload collectionView at orientation Changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
    
    // Reload CollectionView at device Dark/Default mode changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        collectionView.reloadData()
    }
    
    

}

//MARK:- IBActions
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

//MARK:- CollectionView Data Source
extension CatTowerVeiwController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AssetDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatTowerCell
        let catData = AssetDataList[indexPath.row]

        cell.initCell(catData: catData, currentCatName: currentCatName)

        return cell
    }
    
}

//MARK: CollectionViewFlowLayout
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
