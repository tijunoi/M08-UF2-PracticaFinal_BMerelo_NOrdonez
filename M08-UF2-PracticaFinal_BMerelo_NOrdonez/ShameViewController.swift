//
//  ViewController.swift
//  M08-UF2-PracticaFinal_BMerelo_NOrdonez
//
//  Created by Nil Ordoñez Romera on 19/4/18.
//  Copyright © 2018 Nil Ordoñez. All rights reserved.
//

import UIKit

class ShameViewController: UIViewController {
    
    let scaleFactor:CGFloat = 0.8

    @IBOutlet weak var muteButton: UIButton!
    var bellImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "Bell"){
            
//            let bellWidth = view.frame.size.width * scaleFactor;
//            let bellHeight = view.frame.size.height * scaleFactor;
//
            bellImageView = UIImageView(image: image)
            //bellImageView!.frame = CGRect(x: 0, y: 0, width: bellWidth, height: bellHeight)
            bellImageView!.contentMode = UIViewContentMode.scaleToFill
           
            bellImageView!.translatesAutoresizingMaskIntoConstraints = false
            
            
            view.addSubview(bellImageView!)
            bellImageView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            bellImageView!.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn){
                var transform = CGAffineTransform(rotationAngle: 30 * CGFloat.pi / 180)
                transform = transform.scaledBy(x: 1.2, y: 1.2)
                self.bellImageView?.transform = transform
            }
            
            animator.addCompletion { _ in
                let secondAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeIn){
                    var transform = CGAffineTransform(rotationAngle: -30 * CGFloat.pi / 180)
                    transform = transform.scaledBy(x: 1.2, y: 1.2)
                    self.bellImageView?.transform = transform
                }

                secondAnimator.addCompletion { _ in
                    let thirdAnimator =  UIViewPropertyAnimator(duration: 1, curve: .easeIn){
                        var transform = CGAffineTransform(rotationAngle: 30 * CGFloat.pi / 180)
                        transform = transform.scaledBy(x: 1.2, y: 1.2)
                        self.bellImageView?.transform = transform
                    }

                    thirdAnimator.addCompletion { _ in
                        let fourthAnimator =  UIViewPropertyAnimator(duration: 1, curve: .easeIn){
                            self.bellImageView?.transform = CGAffineTransform.identity
                        }

                        fourthAnimator.startAnimation()

                    }

                    thirdAnimator.startAnimation()

                }
                secondAnimator.startAnimation()
            }
            
            animator.startAnimation()
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    }


}

