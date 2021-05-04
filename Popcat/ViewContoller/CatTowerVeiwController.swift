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
    }

    
    @IBAction func doneButtonClicked(_ sender: UIButton) {

        let isLabelVisible = self.popCountSwitch.isOn
        UserDefaults.standard.set(isLabelVisible, forKey: UserDataKey.popCountVisibility)
        
        self.dismiss(animated: false)
    
    }
}

extension CatTowerVeiwController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatTowerCell
        
//        cell.cellImage.image = #imageLiteral(resourceName: "popcat_closed")
        cell.cellName.text = "Popcat"
        
        return cell
    }
    
    
}
