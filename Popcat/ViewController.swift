//
//  ViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popcatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch Down")
        popcatImage.image = #imageLiteral(resourceName: "popcat_opened")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch Up")
        popcatImage.image = #imageLiteral(resourceName: "popcat_closed")
    }
        
}

