//
//  ViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var popcatImage: UIImageView!
    
    var popSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        popcatImage.image = #imageLiteral(resourceName: "popcat_opened")
        
        let popSound = NSDataAsset(name: audioFileName.popOriginal)?.data
        
        do {
            popSoundEffect = try AVAudioPlayer(data: popSound!)
            popSoundEffect?.play()
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
    }
        
}

