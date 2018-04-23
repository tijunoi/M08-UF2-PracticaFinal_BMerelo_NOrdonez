//
//  ViewController.swift
//  M08-UF2-PracticaFinal_BMerelo_NOrdonez
//
//  Created by Nil Ordoñez Romera on 19/4/18.
//  Copyright © 2018 Nil Ordoñez. All rights reserved.
//

import UIKit
import AudioToolbox
import MediaPlayer

class ShameViewController: UIViewController {

    var bellSoundId: SystemSoundID = 0
    var shameSoundId: SystemSoundID = 0
    var backgroundAudioPlayer: AVAudioPlayer?

    @IBOutlet weak var backgroundMusicSwitch: UISwitch!
    
    var bellImageView: UIImageView? {
        didSet {
            let tapBellShameRecognizer = UITapGestureRecognizer(target: self, action: #selector(playShameSound(_:)))
            bellImageView?.addGestureRecognizer(tapBellShameRecognizer)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: registrar sonido de la campana y el shame
        if let soundURL = Bundle.main.url(forResource: "bellring", withExtension: "mp3") {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &bellSoundId)
        }

        if let soundURL = Bundle.main.url(forResource: "shame", withExtension: "mp3") {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &shameSoundId)
        }

        //MARK: background music
        if let backgroundsoundURL = Bundle.main.url(forResource: "bgmusic", withExtension: "mp3") {
            do{
                try backgroundAudioPlayer = AVAudioPlayer(contentsOf: backgroundsoundURL)
                backgroundAudioPlayer?.numberOfLoops = Int(-1)
                backgroundAudioPlayer?.prepareToPlay()
                backgroundAudioPlayer?.play()
            } catch {
                print("No se ha podido inicializar el audio background")
            }
        }

        //MARK: setear animacion de la imagen
        if let image = UIImage(named: "Bell") {


            bellImageView = UIImageView(image: image)
            bellImageView!.contentMode = UIViewContentMode.scaleToFill
            bellImageView!.isUserInteractionEnabled = true

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
            AudioServicesPlaySystemSound(bellSoundId)
            let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
                var transform = CGAffineTransform(rotationAngle: 30 * CGFloat.pi / 180)
                transform = transform.scaledBy(x: 1.2, y: 1.2)
                self.bellImageView?.transform = transform
            }

            animator.addCompletion { _ in
                let secondAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
                    var transform = CGAffineTransform(rotationAngle: -30 * CGFloat.pi / 180)
                    transform = transform.scaledBy(x: 1.2, y: 1.2)
                    self.bellImageView?.transform = transform
                }

                secondAnimator.addCompletion { _ in
                    let thirdAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
                        var transform = CGAffineTransform(rotationAngle: 30 * CGFloat.pi / 180)
                        transform = transform.scaledBy(x: 1.2, y: 1.2)
                        self.bellImageView?.transform = transform
                    }

                    thirdAnimator.addCompletion { _ in
                        let fourthAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
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

    @objc func playShameSound(_ sender: UITapGestureRecognizer) {
        AudioServicesPlaySystemSound(shameSoundId)
    }
    
    @IBAction func musicSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            //activate audio
            backgroundAudioPlayer?.play()
        } else {
            //cancel audio
            backgroundAudioPlayer?.pause()
        }
    }
    


}

