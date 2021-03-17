//
//  ViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var popcatImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var touchEvent = touchEventController()     // this class plays audio file
    let imageDelay = 0.15
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = String(UserDefaults.standard.integer(forKey: UserDataKey.popCount))
        touchEvent.delegate = self
    }
        
    @IBAction func swipeUpGesture(_ sender: Any) {
        performSegue(withIdentifier: Identifier.settingSegue, sender: nil)
    }
}

//MARK:- Change image through Delegate
extension ViewController: touchEventDelegate {
    
    //MARK: touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchDownAction()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchUpAction()
    }
    
    
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

