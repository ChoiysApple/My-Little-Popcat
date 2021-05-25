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
    
    //MARK: Helper Classes
    private var touchEvent = touchEventManager()
    private let dataManager = UserDataManager()
    
    // Timer related
    private let imageDelay = 0.15
    private var timer = Timer()
    private var isNotFirstLaunch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNotFirstLaunch = dataManager.getIsInitialLaunch()
        if !isNotFirstLaunch {
            tutorialView.isHidden = false
            dataManager.setIsInitialLaunch(isFirst: true)
            
            dataManager.setCatData(catData: defaultAssetData)
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
        let currentCount = dataManager.getPopCount()
        dataManager.setPopCount(popCount: currentCount-1)
        performSegue(withIdentifier: Identifier.settingSegue, sender: nil)
    }
}

//MARK:- Custom methods
extension MainViewController {
    
    // apply current settings
    func updateViewSettings() {
        countLabel.isHidden = !dataManager.getPopVisibility()
        countLabel.text = String(dataManager.getPopCount())
        
        let catData = dataManager.getCatData()
        touchUpImageSource = UIImage(named: catData.closedImageName)
        touchDownImageSource = UIImage(named: catData.openedImageName)
        popcatImage.image = touchUpImageSource
        
        touchEvent.setAudioSource(audioSource: catData.audioSourceName)
        timer.invalidate()
    }
    
    
}

