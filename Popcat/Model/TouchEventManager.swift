//
//  audioManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/09.
//

import Foundation
import AVFoundation
import UIKit

protocol touchEventDelegate {
    func touchDownImage()
    func touchUpImage(count: Int)
    func displayUnlockedBanner(catData: AssetData)
}

class TouchEventManager {
    
    var delegate: touchEventDelegate?
    private var popSoundEffect: AVAudioPlayer?
    
    var popSoundSource: String?
    var popSoundVolume: Float

    let dataManager = UserDataManager()
    
    init(source: String, volume: Float) {
        self.popSoundSource = source
        self.popSoundVolume = volume
    }
    
    
    func touchDownAction() {
        // play sound
        let popSound = NSDataAsset(name: popSoundSource ?? defaultAssetData.audioSourceName)?.data
        do {
            popSoundEffect = try AVAudioPlayer(data: popSound!)
            popSoundEffect?.setVolume(popSoundVolume, fadeDuration: 0)
            popSoundEffect?.play()
            
        } catch {
            fatalError(error.localizedDescription)
        }
        

        delegate?.touchDownImage()
    }
    
    func touchUpAction() {
        
        // update popcount
        var storedCount = dataManager.getPopCount()
        storedCount += 1
        UserDefaults.standard.set(storedCount, forKey: UserDataKey.popCount)
        
        checkNewCatUnlock()
        delegate?.touchUpImage(count: storedCount)
    }
    
    private func checkNewCatUnlock() {
        
        var unlockData = dataManager.getUnlockData()
        let storedCount = dataManager.getPopCount()
        
        for catAsset in AssetDataList {
            if unlockData[catAsset.catName] == false && catAsset.unlockThreshold <= storedCount {
                unlockData.updateValue(true, forKey: catAsset.catName)
                dataManager.setUnlockData(unlockedCat: unlockData)
                
                delegate?.displayUnlockedBanner(catData: catAsset)
                return
            }
        }
        
    }
    
}
