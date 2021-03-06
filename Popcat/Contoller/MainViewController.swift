//
//  ViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit
import AVFoundation
import BRYXBanner

class MainViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var popcatImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var guideView: UIStackView!

    
    
    //MARK: touchEventImage
    private var touchDownImageSource: UIImage?
    private var touchUpImageSource: UIImage?
    
    //MARK: Helper Classes
    private var touchEvent = TouchEventManager(source: defaultAssetData.audioSourceName, volume: 1.0)
    private let dataManager = UserDataManager()
    
    // Timer related
    private let imageDelay = 0.08
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Display onboarding
        if !dataManager.getIsNotInitialLaunch() {
            getOnboardingViewController(onboardingDataList: OnboardingData.mainView.onboardingDataList).presentFrom(self, animated: true)
            dataManager.setIsNotInitialLaunch(isNotFirst: true)
        }
    
        // Guide label settings
        if dataManager.getIsNotInitialCatTower() {
            guideView.isHidden = true
        } else {
            guideLabel.attributedText = NSAttributedString(string: "Swipe up!".localized)
            guideView.isHidden = false
        }
        
        updateViewSettings()
        touchEvent.delegate = self

    }

}

//MARK:- touch Event Delegate
extension MainViewController: touchEventDelegate {

    func touchDownImage() {
        timer.invalidate()
        popcatImage.image = touchUpImageSource
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false) { timer in
            self.popcatImage.image = self.touchDownImageSource
        }
    }
    
    func touchUpImage(count: Int) {
        countLabel.text = String(count)
        timer = Timer.scheduledTimer(withTimeInterval: imageDelay, repeats: false) { timer in
            self.popcatImage.image = self.touchUpImageSource
        }
        
    }
    
    // Display BRYXBanner
    func displayUnlockedBanner(catData: AssetData){
        
        let banner = Banner(title: catData.catName, subtitle: "Reached \(catData.unlockThreshold) taps", image: UIImage(named: catData.mainImageName), backgroundColor: UIColor(named: "BgColor")!)
        
        banner.titleLabel.textColor = UIColor(named: "Color")
        banner.detailLabel.textColor = UIColor(named: "Color")
        
        banner.imageView.contentMode = .scaleAspectFit

        banner.dismissesOnTap = true
        banner.dismissesOnSwipe = true
        banner.show(duration: 2.0)
    }
    
}

//MARK:- UI touch events
extension MainViewController {
    
    // touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == self.view {
            touchEvent.touchDownAction()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, touch.view == self.view {
            touchEvent.touchUpAction()
        }
    }
    
    // Gesture events
    @IBAction func swipeUpGesture(_ sender: Any) {
        self.popcatImage.image = self.touchUpImageSource
        performSegue(withIdentifier: Identifier.settingSegue, sender: nil)
    }
}

//MARK:- Custom methods
extension MainViewController {
    
    // apply current settings
    func updateViewSettings() {
        
        // count label settings
        countLabel.isHidden = !dataManager.getPopVisibility()
        countLabel.text = String(dataManager.getPopCount())

        
        let catData = dataManager.getCatData()
        touchUpImageSource = UIImage(named: catData.closedImageName)
        touchDownImageSource = UIImage(named: catData.openedImageName)
        popcatImage.image = touchUpImageSource
    
        let popSoundVolume = dataManager.getPopSoundVolume()
        
        touchEvent = TouchEventManager(source: catData.audioSourceName, volume: popSoundVolume)
        timer.invalidate()
        
        
    }
    
}

