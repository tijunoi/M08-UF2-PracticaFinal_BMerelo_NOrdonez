//
//  PollitosViewCintrollerViewController.swift
//  M08-UF2-PracticaFinal_BMerelo_NOrdonez
//
//  Created by Nil Ordoñez Romera on 22/4/18.
//  Copyright © 2018 Nil Ordoñez. All rights reserved.
//

import UIKit
import AudioToolbox


class PollitosViewController: UIViewController {

    
    
    @IBOutlet weak var pollito1ImageView: UIImageView! {
        didSet{
            let tapPollito = UITapGestureRecognizer(target: self, action: #selector(soundPollito(_:)))
            pollito1ImageView.addGestureRecognizer(tapPollito)
            let panPollito = UIPanGestureRecognizer(target: self, action: #selector(panPollito1(_:)))
            pollito1ImageView.addGestureRecognizer(panPollito)
        }
    }
    @IBOutlet weak var pollito2ImageView: UIImageView! {
        didSet{
            let tapPollito = UITapGestureRecognizer(target: self, action: #selector(soundPollito(_:)))
            pollito2ImageView.addGestureRecognizer(tapPollito)
            let panPollito = UIPanGestureRecognizer(target: self, action: #selector(panPollito2(_:)))
            pollito2ImageView.addGestureRecognizer(panPollito)
        }
    }
    @IBOutlet weak var pollito3ImageView: UIImageView! {
        didSet{
            let tapPollito = UITapGestureRecognizer(target: self, action: #selector(soundPollito(_:)))
            pollito3ImageView.addGestureRecognizer(tapPollito)
            let panPollito = UIPanGestureRecognizer(target: self, action: #selector(panPollito3(_:)))
            pollito3ImageView.addGestureRecognizer(panPollito)
        }
    }
    @IBOutlet weak var pollito4ImageView: UIImageView!{
        didSet{
            let tapPollito = UITapGestureRecognizer(target: self, action: #selector(soundPollito(_:)))
            pollito4ImageView.addGestureRecognizer(tapPollito)
            let panPollito = UIPanGestureRecognizer(target: self, action: #selector(panPollito4(_:)))
            pollito4ImageView.addGestureRecognizer(panPollito)
        }
    }
    
    var pollitoSound: SystemSoundID = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let soundURL = Bundle.main.url(forResource: "pollitococo", withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &pollitoSound)
        }
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
    
    @objc func soundPollito(_ sender: UITapGestureRecognizer){
        AudioServicesPlaySystemSound(pollitoSound)
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer, pollitoView: UIImageView){
        switch sender.state{
        case .changed:
            let translation = sender.translation(in: pollitoView)
            let transforming = CGAffineTransform(translationX: translation.x, y: translation.y)
            pollitoView.transform = transforming
            //sender.setTranslation(CGPoint.zero, in: pollitoView)
        case .ended:
            let pollitoAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
                pollitoView.transform = CGAffineTransform.identity
            }
            pollitoAnimator.startAnimation()
            sender.setTranslation(CGPoint.zero, in: pollitoView)
        default:
            break
        }
    }
    
    @objc func panPollito1(_ sender: UIPanGestureRecognizer) {
        panGesture(sender, pollitoView: pollito1ImageView)
    }

    @objc func panPollito2(_ sender: UIPanGestureRecognizer) {
        panGesture(sender, pollitoView: pollito2ImageView)
    }
    
    @objc func panPollito3(_ sender: UIPanGestureRecognizer) {
        panGesture(sender, pollitoView: pollito3ImageView)
    }
    
    @objc func panPollito4(_ sender: UIPanGestureRecognizer) {
        panGesture(sender, pollitoView: pollito4ImageView)
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
