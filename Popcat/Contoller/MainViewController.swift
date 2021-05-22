//
//  ViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var popcatImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tutorialView: UIView!
    
    //MARK: touchEventImage
    private var touchDownImageSource: UIImage?
    private var touchUpImageSource: UIImage?
    private var touchEvent = touchEventManager()
    
    // Timer related
    private let imageDelay = 0.15
    private var timer = Timer()
    private var isNotFirstLaunch = UserDefaults.standard.bool(forKey: UserDataKey.isNotFirstLaunch)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isNotFirstLaunch {
            tutorialView.isHidden = false
            UserDefaults.standard.set(isNotFirstLaunch, forKey: UserDataKey.isNotFirstLaunch)
            UserDefaults.standard.set(defaultAssetData.catName, forKey: UserDataKey.currentCatName)
            UserDefaults.standard.set(defaultAssetData.openedImageName, forKey: UserDataKey.touchDownImage)
            UserDefaults.standard.set(defaultAssetData.closedImageName, forKey: UserDataKey.touchUpImage)
            UserDefaults.standard.set(defaultAssetData.audioSourceName, forKey: UserDataKey.popSound)
        }
        
        touchEvent.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateViewSettings()
    }

}

//MARK:- touch Event Delegate
extension MainViewController: touchEventDelegate {

    func touchDownImage(count: Int) {
        
        if !isNotFirstLaunch {
            isNotFirstLaunch = true
            DispatchQueue.main.async {
                self.tutorialView.isHidden = true
            }
                
            UserDefaults.standard.set(true, forKey: UserDataKey.isNotFirstLaunch)
        }
        
        timer.invalidate()
        popcatImage.image = touchUpImageSource
        countLabel.text = String(count)
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { timer in
            self.popcatImage.image = self.touchDownImageSource
        }
    }
    
    func touchUpImage() {
        timer = Timer.scheduledTimer(withTimeInterval: imageDelay, repeats: false) { timer in
            self.popcatImage.image = self.touchUpImageSource
        }
    }
    
}

//MARK:- UI touch events
extension MainViewController {
    
    // touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchDownAction()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchUpAction()
    }
    
    // Gesture events
    @IBAction func swipeUpGesture(_ sender: Any) {
        let currentCount = UserDefaults.standard.integer(forKey: UserDataKey.popCount)
        UserDefaults.standard.set(currentCount-1, forKey: UserDataKey.popCount)
        performSegue(withIdentifier: Identifier.settingSegue, sender: nil)
    }
}

//MARK:- Custom methods
extension MainViewController {
    
    // apply current settings
    func updateViewSettings() {
        countLabel.isHidden = !UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
        countLabel.text = String(UserDefaults.standard.integer(forKey: UserDataKey.popCount))
        
        let touchUpImageName = UserDefaults.standard.string(forKey: UserDataKey.touchUpImage) ?? defaultAssetData.openedImageName
        let touchDownImageName = UserDefaults.standard.string(forKey: UserDataKey.touchDownImage) ?? defaultAssetData.closedImageName
        touchUpImageSource = UIImage(named: touchUpImageName)
        touchDownImageSource = UIImage(named: touchDownImageName)
        popcatImage.image = touchUpImageSource
        
        touchEvent.setAudioSource(audioSource: UserDefaults.standard.string(forKey: UserDataKey.popSound) ?? defaultAssetData.audioSourceName)
        timer.invalidate()
    }
    
    
}
