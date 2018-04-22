//
//  ViewController.swift
//  M08-UF2-PracticaFinal_BMerelo_NOrdonez
//
//  Created by Nil Ordoñez Romera on 19/4/18.
//  Copyright © 2018 Nil Ordoñez. All rights reserved.
//

import UIKit

class ShameViewController: UIViewController {

    @IBOutlet weak var muteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
             var transform = CGAffineTransform(scaleX: CGFloat(2), y: CGFloat(2))
            
            muteButton.transform = transform
        }
    }


}

