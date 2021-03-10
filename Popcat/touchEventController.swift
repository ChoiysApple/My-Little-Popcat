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
    func touchUpImage()
}

class touchEventController {
    
    var delegate: touchEventDelegate?
    var popSoundEffect: AVAudioPlayer?
    
    
    func touchDownAction() {
        let popSound = NSDataAsset(name: audioFileName.popOriginal)?.data
        
        do {
            popSoundEffect = try AVAudioPlayer(data: popSound!)
            popSoundEffect?.play()
            
        } catch {
            fatalError(error.localizedDescription)
        }
        
        delegate?.touchDownImage()
        
    }
    
    func touchUpAction() {
        let time = DispatchTime.now() + .milliseconds(80)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.delegate?.touchUpImage()
        }
    }
    
    
}
