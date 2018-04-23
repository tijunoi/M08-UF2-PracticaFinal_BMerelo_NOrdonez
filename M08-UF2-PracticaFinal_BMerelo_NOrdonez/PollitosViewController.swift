//
//  PollitosViewCintrollerViewController.swift
//  M08-UF2-PracticaFinal_BMerelo_NOrdonez
//
//  Created by Nil Ordoñez Romera on 22/4/18.
//  Copyright © 2018 Nil Ordoñez. All rights reserved.
//

import UIKit

class PollitosViewController: UIViewController {

    @IBOutlet weak var pollito1ImageView: UIImageView!
    @IBOutlet weak var pollito2ImageView: UIImageView!
    @IBOutlet weak var pollito3ImageView: UIImageView!
    @IBOutlet weak var pollito4ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        rotatePollito(pollito1ImageView)
        rotatePollito(pollito2ImageView)
        rotatePollito(pollito3ImageView)
        rotatePollito(pollito4ImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func rotatePollito(_ sender: UIImageView){
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        animator.startAnimation()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
