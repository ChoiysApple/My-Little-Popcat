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
    
    var touchEvent = touchEventController()
    
    let imageDelay = 0.15
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize countlabel value
        
        
        touchEvent.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateViewSettings()
    }
    
    func updateViewSettings() {
        countLabel.isHidden = !UserDefaults.standard.bool(forKey: UserDataKey.popCountVisibility)
        countLabel.text = String(UserDefaults.standard.integer(forKey: UserDataKey.popCount))
        popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
        timer.invalidate()
    }

}

//MARK:- touch Event Delegate
extension MainViewController: touchEventDelegate {

    func touchDownImage(count: Int) {
        timer.invalidate()
        popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
        countLabel.text = String(count)
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { timer in
            self.popcatImage.image = #imageLiteral(resourceName: "popcat_opened")
        }
    }
    
    func touchUpImage() {
        timer = Timer.scheduledTimer(withTimeInterval: imageDelay, repeats: false) { timer in
            self.popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
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


