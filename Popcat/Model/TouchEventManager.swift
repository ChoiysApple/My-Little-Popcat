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
    func touchDownImage(count: Int)
    func touchUpImage()
}

class TouchEventManager {
    
    var delegate: touchEventDelegate?
    private var popSoundEffect: AVAudioPlayer?
    private var popSoundSource: String?
    
    func setAudioSource(audioSource: String) {
        popSoundSource = audioSource
    }
    
    func touchDownAction() {
        
        // play sound
        let popSound = NSDataAsset(name: popSoundSource ?? defaultAssetData.audioSourceName)?.data
        do {
            popSoundEffect = try AVAudioPlayer(data: popSound!)
            popSoundEffect?.play()
            
        } catch {
            fatalError(error.localizedDescription)
        }
        
        // update popcount
        var storedCount = UserDefaults.standard.integer(forKey: UserDataKey.popCount)
        storedCount += 1
        UserDefaults.standard.set(storedCount, forKey: UserDataKey.popCount)
        delegate?.touchDownImage(count: storedCount)
    }
    
    func touchUpAction() {
        delegate?.touchUpImage()
    }
    
}
