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
    
    var touchEvent = touchEventController()     // this class plays audio file
    let imageDelay = 0.15
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchEvent.delegate = self
    }
        
}

//MARK:- Change image through Delegate
extension ViewController: touchEventDelegate {
    
    //MARK: - touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchDownAction()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent.touchUpAction()
    }
    
    
    func touchDownImage() {
        timer.invalidate()
        popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
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


